#!/usr/bin/env python3
from __future__ import annotations

import argparse
import shutil
from pathlib import Path

TEXT_SUFFIXES = {
    '.md',
    '.yaml',
    '.yml',
    '.json',
    '.txt',
    '.py',
    '.sh',
    '.toml',
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description='Bootstrap the full AI project-management template into a target repository.'
    )
    parser.add_argument('--target', required=True, help='Absolute path to the target repository')
    parser.add_argument('--project-name', default='your-project', help='Project name used in placeholders')
    parser.add_argument('--force', action='store_true', help='Overwrite existing files when collisions happen')
    return parser.parse_args()


def collect_collisions(src_root: Path, dst_root: Path) -> list[Path]:
    collisions: list[Path] = []
    for src in src_root.rglob('*'):
        if src.is_dir():
            continue
        rel = src.relative_to(src_root)
        dst = dst_root / rel
        if dst.exists():
            collisions.append(rel)
    return collisions


def copy_tree(src_root: Path, dst_root: Path, project_root: str, project_name: str, force: bool) -> None:
    for src in sorted(src_root.rglob('*')):
        rel = src.relative_to(src_root)
        dst = dst_root / rel
        if src.is_dir():
            dst.mkdir(parents=True, exist_ok=True)
            continue

        dst.parent.mkdir(parents=True, exist_ok=True)
        if dst.exists() and not force:
            raise FileExistsError(f'Refusing to overwrite existing file: {dst}')

        if src.suffix in TEXT_SUFFIXES:
            content = src.read_text(encoding='utf-8')
            content = content.replace('__PROJECT_ROOT__', project_root)
            content = content.replace('__PROJECT_NAME__', project_name)
            dst.write_text(content, encoding='utf-8')
        else:
            shutil.copy2(src, dst)


def main() -> None:
    args = parse_args()
    repo_root = Path(__file__).resolve().parent.parent
    template_root = repo_root / 'templates' / 'project-system-template'
    target_root = Path(args.target).expanduser().resolve()

    if not target_root.is_absolute():
        raise SystemExit('--target must resolve to an absolute path')
    if not target_root.exists():
        raise SystemExit(f'Target repository does not exist: {target_root}')

    collisions = collect_collisions(template_root, target_root)
    if collisions and not args.force:
        joined = '\n'.join(f'- {item}' for item in collisions[:20])
        more = '' if len(collisions) <= 20 else f'\n... and {len(collisions) - 20} more'
        raise SystemExit(
            'Found existing files in target repository. Re-run with --force to overwrite:\n'
            f'{joined}{more}'
        )

    copy_tree(template_root, target_root, str(target_root), args.project_name, args.force)
    print(f'Project template bootstrapped into: {target_root}')


if __name__ == '__main__':
    main()
