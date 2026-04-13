# 全局 Agent 与 Skill 说明

## 1. 文档目的

这份文档用于说明当前这台机器上的 Codex 全局 Agent / Skill 安装情况，帮助你快速回答下面这些问题：

- 现在全局到底装了哪些 agent / skill
- 每一类 agent / skill 分别适合做什么
- 这些 agent / skill 来自哪里
- 名字前缀不同代表什么
- 后面如果要升级、清理、重装，应该从哪里下手

## 2. 当前全局安装总览

当前机器上的 Agent / Skill 入口分成四层：

1. `~/.claude/skills/gstack`：`gstack` 流程技能套件，当前目录下共有 `32` 份 `SKILL.md`（含 `1` 个总入口和 `31` 个子技能）
2. `~/.skillshub/agency-*`：`agency-*` 专家角色技能，当前共 `156` 个
3. `~/.codex/skills`：Codex 全局通用技能，当前共 `7` 个（`2` 个治理 core skill + `5` 个 `.system` 技能）
4. 仓库内 `.codex/skills/`：当前项目本地适配器技能，默认由 [.codex/skills/README.md](__PROJECT_ROOT__/.codex/skills/README.md) 统一说明

按来源区分如下：

### 2.1 gstack

- 来源仓库：`https://github.com/garrytan/gstack`
- 本地源码目录：当前本地拷贝直接位于 [~/.claude/skills/gstack](/Users/sunlizhou/.claude/skills/gstack)
- 全局 skill 目录：[~/.claude/skills/gstack](/Users/sunlizhou/.claude/skills/gstack)
- 命名特征：以 `gstack-` 开头
- 主要定位：
  - 更像“一套完整的软件交付流程工具箱”
  - 偏计划、评审、QA、发布、回顾、安全控制

### 2.2 agency-agents

- 来源仓库：`https://github.com/msitarzewski/agency-agents`
- 本地源码目录：Agent 源码同步来自 `~/.skillshub` 下的多个 `agency-*` 目录，实际调度时直接从 `[~/.skillshub](/Users/sunlizhou/.skillshub)` 下读取。
- 转换后来源目录：同上（`~/.skillshub` 里已经按 `agency-*` 命名完成适配，不再需要额外转换步骤）。
- 全局 skill 目录：[~/.skillshub](/Users/sunlizhou/.skillshub)
- 命名特征：以 `agency-` 开头
- 主要定位：
  - 更像“角色型专家库”
  - 偏具体专业角色，例如前端、后端、SEO、销售、测试、产品、项目管理、XR、专业顾问等

### 2.3 Codex 自带系统 skills

- 目录：[~/.codex/skills/.system](/Users/sunlizhou/.codex/skills/.system)
- 同目录下还保留 `ai-doc-ops-core` 与 `doc-governance-core` 两个全局治理 core skill，供项目 adapter 复用
- 主要定位：
  - Codex 官方自带能力
  - 偏安装、脚手架、OpenAI 文档查询和通用治理骨架等系统级辅助

## 3. 命名规则说明

为了后续使用时不混淆，建议这样理解：

- `gstack-*`
  - 偏“流程型技能”
  - 适合做计划、评审、QA、发布、回顾、浏览器验证、安全护栏
- `agency-*`
  - 偏“专家型角色”
  - 适合让模型用某个固定专业角色来思考和输出
- `.system/*`
  - Codex 平台内置
  - 偏系统辅助与官方能力

如果你是想：

- 让 AI 以某种岗位身份来工作：优先找 `agency-*`
- 让 AI 按完整研发流程推进：优先找 `gstack-*`
- 做技能安装、插件创建、OpenAI 文档查询：优先找 `.system/*`

## 4. gstack 全局 Skills 说明

当前常用的 `gstack` 子 skill 共 `26` 个；此外目录中还保留总入口和少量辅助技能（例如 `codex`、`connect-chrome`、`design-html`、`design-shotgun`、`learn`），本文重点说明最常用的一组。

### 4.1 规划与方案评审

- `gstack-office-hours`：用于从需求本质出发重新梳理问题，像创业公司办公室答疑一样帮助你澄清方向、范围和优先级。
- `gstack-plan-ceo-review`：从 CEO / 创始人视角重新审视方案，重点看产品价值、方向、取舍和机会窗口。
- `gstack-plan-eng-review`：从工程负责人视角审查架构、边界、技术风险、实现路径和测试覆盖。
- `gstack-plan-design-review`：从设计负责人视角审视体验、交互、信息层级和视觉决策。
- `gstack-autoplan`：把多个规划 / 评审环节串起来，自动生成一套更完整的方案审查流程。

### 4.2 设计与构建

- `gstack-design-consultation`：偏设计咨询，用于快速梳理设计方向、设计体系和界面表达。
- `gstack-design-review`：对现有设计或前端实现做设计质量审查，重点抓“AI 味太重”“交互不自然”“视觉不统一”等问题。
- `gstack-review`：通用代码评审 skill，偏发现 bug、缺口、风险和质量问题。
- `gstack-investigate`：偏问题排查 / 调查，用于系统性追踪异常、定位根因、整理证据链。

### 4.3 浏览器与验证

- `gstack-browse`：真实浏览器能力入口，适合访问页面、点击、截图、抓取界面状态。
- `gstack-qa`：面向质量保证的综合验证 skill，适合对网页 / 应用进行完整 QA 走查。
- `gstack-qa-only`：偏只做 QA 报告，不强调顺手修复。
- `gstack-benchmark`：偏性能基准测试，用于衡量加载、交互或资源开销。
- `gstack-canary`：偏上线后的观察与试运行验证，适合灰度 / 金丝雀阶段。
- `gstack-setup-browser-cookies`：帮助浏览器 skill 使用登录态 cookie，适合需要登录后验证页面的场景。

### 4.4 发布与收尾

- `gstack-ship`：面向提交 / 出货前的流程收口，适合在发布前统一做检查、整理和交付。
- `gstack-land-and-deploy`：偏合并与部署后的收尾动作。
- `gstack-setup-deploy`：用于配置部署相关信息，方便后续部署流程技能使用。
- `gstack-document-release`：在功能发布后补齐文档、变更说明、发布记录。
- `gstack-retro`：用于项目回顾 / 复盘，沉淀经验、问题和改进建议。
- `gstack-upgrade`：用于升级 gstack 本身。

### 4.5 安全与边界控制

- `gstack-careful`：提醒模型在执行危险动作前更加谨慎。
- `gstack-freeze`：限制工作范围，避免改动超出当前约定边界。
- `gstack-guard`：综合性的安全护栏模式。
- `gstack-unfreeze`：解除冻结 / 范围限制。
- `gstack-cso`：偏安全负责人视角，关注安全风险、安全评审和系统防护问题。

### 4.6 gstack 使用建议

如果你要走“从想法到发布”的完整链路，通常可以按下面的节奏选：

- 需求还没想清楚：`gstack-office-hours`
- 方案需要过产品脑：`gstack-plan-ceo-review`
- 方案需要过工程脑：`gstack-plan-eng-review`
- 方案需要过设计脑：`gstack-plan-design-review`
- 代码写完要审：`gstack-review`
- 页面要实测：`gstack-browse` / `gstack-qa`
- 要发版：`gstack-ship`
- 发完要复盘：`gstack-retro`

## 5. agency-agents 全局 Skills 说明

当前已安装的 `agency-*` 全局 skill 共 `156` 个。它们更适合“指定一个专家角色，再让 AI 以这个角色的方式来工作”。

### 5.1 Academic

- `agency-anthropologist`：文化系统、仪式、族群关系和民族志视角专家，适合世界观、社会结构和文化合理性设计。
- `agency-geographer`：地理、气候、地形和空间逻辑专家，适合地图、区域规划和世界设定。
- `agency-historian`：历史研究与史学方法专家，适合历史背景、时代质感和史实一致性校对。
- `agency-narratologist`：叙事理论专家，适合故事结构、角色弧线、叙事机制分析。
- `agency-psychologist`：心理学与行为动机专家，适合角色可信度、动机设计和用户行为分析。

### 5.2 Design

- `agency-brand-guardian`：品牌守护者，适合品牌识别、品牌一致性、定位和品牌规范建设。
- `agency-image-prompt-engineer`：AI 图像提示词专家，适合摄影风、视觉风格和高质量图像生成提示设计。
- `agency-inclusive-visuals-specialist`：包容性视觉专家，适合降低刻板印象、处理多元文化和公平表达。
- `agency-ui-designer`：UI 设计专家，适合界面、组件、视觉系统和像素级细节设计。
- `agency-ux-architect`：UX 架构专家，适合产品体验结构、CSS 体系和可实现的设计方案。
- `agency-ux-researcher`：UX 研究专家，适合访谈、可用性测试、用户洞察和研究输出。
- `agency-visual-storyteller`：视觉叙事专家，适合把复杂信息变成有表达力的视觉内容。
- `agency-whimsy-injector`：趣味设计注入器，适合在产品中增加个性、惊喜和品牌记忆点。

### 5.3 Engineering

- `agency-ai-data-remediation-engineer`：数据修复工程师，专注坏数据识别、聚类修复和不丢数的数据补救。
- `agency-ai-engineer`：AI 工程师，适合模型接入、机器学习功能、AI 系统集成。
- `agency-autonomous-optimization-architect`：自主优化架构师，适合 API 路由、成本控制和性能治理。
- `agency-backend-architect`：后端架构师，适合 API、数据库、服务拆分和云端架构。
- `agency-code-reviewer`：代码审查专家，适合正确性、可维护性、安全和性能层面的 review。
- `agency-data-engineer`：数据工程师，适合 ETL/ELT、数仓、数据管道和湖仓架构。
- `agency-database-optimizer`：数据库优化专家，适合索引、查询调优、Schema 设计和数据库性能。
- `agency-devops-automator`：DevOps 自动化专家，适合 CI/CD、基础设施自动化、部署流程优化。
- `agency-embedded-firmware-engineer`：嵌入式固件工程师，适合 ESP32、STM32、RTOS、底层驱动等固件开发。
- `agency-feishu-integration-developer`：飞书集成开发者，适合机器人、流程、表格、多维表、审批等飞书场景。
- `agency-frontend-developer`：前端开发专家，适合 React/Vue/Angular、组件、UI 落地和性能优化。
- `agency-git-workflow-master`：Git 工作流专家，适合分支策略、commit 规范、rebase、worktree、协作流程设计。
- `agency-incident-response-commander`：事故响应指挥官，适合线上故障指挥、应急响应和复盘机制建设。
- `agency-mobile-app-builder`：移动应用开发者，适合 iOS、Android、React Native、Flutter 等移动端方案。
- `agency-rapid-prototyper`：快速原型专家，适合 MVP、POC、黑客松和高速迭代场景。
- `agency-security-engineer`：安全工程师，适合威胁建模、漏洞评估、安全设计和安全审计。
- `agency-senior-developer`：高级开发者，偏复杂实现、Laravel/Livewire 等高强度工程落地。
- `agency-software-architect`：软件架构师，适合 DDD、架构模式、系统演进和技术选型。
- `agency-solidity-smart-contract-engineer`：Solidity 智能合约工程师，适合 DeFi、EVM 合约、Gas 优化和升级代理。
- `agency-sre-site-reliability-engineer`：SRE 专家，适合 SLO、错误预算、可观测性和稳定性治理。
- `agency-technical-writer`：技术写作者，适合 API 文档、README、教程和开发文档。
- `agency-threat-detection-engineer`：威胁检测工程师，适合 SIEM 规则、ATT&CK 映射和威胁狩猎。
- `agency-wechat-mini-program-developer`：微信小程序开发者，适合小程序、支付、消息、微信生态接入。

### 5.3.1 本项目“需求修改意见”默认审查 agent 选型

从当前项目规则看，用户每次提出需求修改意见时，默认要先调取合适的 agent 做需求审查，再进入 UI 修改或开发。

推荐选型如下：

- `agency-product-manager`
  适用于业务需求、功能点范围、规则合理性、需求完整性审查
- `agency-ui-designer`
  适用于页面结构、版式调整、信息密度、操作入口合理性审查
- `agency-ux-architect`
  适用于复杂交互流、工作台组织方式、同页联动和操作效率审查
- `agency-software-architect`
  适用于模块边界、通用能力复用、目录拆分、前后端边界审查

执行原则：

- 默认只选 `1` 个最合适的主审查 agent
- 如果修改同时跨业务规则、页面结构、交互方式、模块边界等两个以上维度，可按需追加 `1~2` 个补充 agent
- 需求审查 agent 总数默认不超过 `3`
- 审查结论用于帮助补足需求和发现遗漏
- 补充 agent 只补充自己负责视角下的风险，不重复复述全案
- 最终结论由主线程统一合并并与用户沟通
- 审查完成后，再进入 UI 修改、实施文档更新或代码开发

### 5.3.2 本项目“全工作必须先匹配 agent”默认选型

从当前项目规则看，项目内所有工作默认都要先匹配合适的主 agent，再进入执行。

重点覆盖：

1. 写文档
2. 数据库设计
3. 接口设计
4. 页面 UI 设计
5. 测试与验证
6. 部署、发版、联调、排障
7. 复盘、治理和交接整理

推荐选型如下：

- 写需求 / 方案 / 实施 / 评审文档：
  - `agency-product-manager`
  - `agency-technical-writer`
  - `gstack-plan-eng-review`
- 数据库设计：
  - `agency-backend-architect`
  - `agency-database-optimizer`
  - `agency-software-architect`
- 接口设计：
  - `agency-backend-architect`
  - `agency-software-architect`
  - `agency-technical-writer`
- 页面 UI 设计：
  - `agency-ui-designer`
  - `agency-ux-architect`
  - `gstack-plan-design-review`
- 测试设计 / 测试执行 / 验证结论：
  - `agency-api-tester`
  - `agency-accessibility-auditor`
  - `agency-reality-checker`
  - `gstack-qa`
  - `gstack-browse`
- 部署 / 发版 / 联调 / 排障：
  - `agency-devops-automator`
  - `agency-sre-site-reliability-engineer`
  - `agency-incident-response-commander`
  - `gstack-investigate`
  - `gstack-ship`
- 复盘 / 治理 / 交接整理：
  - `agency-project-shepherd`
  - `agency-workflow-optimizer`
  - `agency-technical-writer`
  - `gstack-retro`

执行原则：

- 默认选 `1` 个最合适的主 agent，主线程负责收口
- 关键产出完成后，默认再选 `1` 个独立复核 agent 做审查
- 只有在任务明确跨多个维度时，才按需追加补充 agent
- 文档、数据库、接口、UI、测试、部署、排障、复盘这些环节都不再默认由主线程单独硬扛
- 只有在“没有合适 agent / agent 平台不可用 / 用户明确禁止使用 agent”时，才允许本轮不启用 agent

### 5.3.3 本项目“关键产出独立复核”默认选型

从当前项目规则看，需求、页面、规则、实施、数据库、接口、页面设计和代码实现等关键产出，默认都要在主 agent 完成后，再由 `1` 个独立复核 agent 做第二轮检查。

推荐选型如下：

- 需求说明书 / 页面清单 / 规则清单：
  - `agency-product-manager`
  - `gstack-plan-eng-review`
  - `agency-technical-writer`
- UI 方案 / 页面结构设计 / 预览页方案：
  - `agency-ux-architect`
  - `gstack-plan-design-review`
  - `agency-ui-designer`
- 数据库架构设计 / 表结构设计：
  - `agency-software-architect`
  - `agency-database-optimizer`
  - `gstack-plan-eng-review`
- API 接口清单 / 技术方案：
  - `agency-software-architect`
  - `agency-backend-architect`
  - `agency-technical-writer`
- 实施文档 / 评审文档 / 测试结论：
  - `gstack-plan-eng-review`
  - `agency-product-manager`
  - `agency-technical-writer`
- 代码实现：
  - `agency-code-reviewer`
  - `gstack-review`
  - 如有专项风险，再按需追加 `agency-security-engineer`、`agency-ui-designer`、`agency-software-architect`

执行原则：

- 默认保留“`1` 个主 agent + `1` 个独立复核 agent + 主线程收口”的最小闭环
- 复核 agent 不应与主 agent 完全重合
- 非代码产出重点复核：完整性、全面性、规则一致性、可实施性、规范符合度
- 代码产出重点复核：正确性、简洁性、可维护性、回归风险、测试与文档回填缺口
- 需求 / 页面 / 规则类产出，复核优先补不同视角；数据库 / 接口类产出，复核优先补架构与边界视角；代码类产出，复核优先补 code review、架构、安全或 UI 一致性视角
- 纯错别字、纯链接修复、纯排版整理等无语义改动，可只做主线程自检，不强制走完整双 agent 流程

### 5.4 Game Development

- `agency-game-audio-engineer`：游戏音频工程师，适合音效、空间音频、FMOD/Wwise 和交互音频设计。
- `agency-game-designer`：游戏设计师，适合玩法循环、数值系统、GDD 和游戏机制设计。
- `agency-level-designer`：关卡设计师，适合布局、节奏、流程和环境叙事设计。
- `agency-narrative-designer`：叙事设计师，适合分支剧情、对话、世界观叙事设计。
- `agency-technical-artist`：技术美术，适合资源管线、Shader、VFX 和性能预算。

### 5.5 Marketing

- `agency-ai-citation-strategist`：AI 引用优化专家，适合品牌在 ChatGPT、Claude、Gemini、Perplexity 等中的可见性提升。
- `agency-app-store-optimizer`：应用商店优化专家，适合 ASO、转化提升和下载增长。
- `agency-baidu-seo-specialist`：百度 SEO 专家，适合中文搜索生态、ICP 和百度优化。
- `agency-bilibili-content-strategist`：B 站内容策略专家，适合 UP 主成长、社区风格和内容矩阵。
- `agency-book-co-author`：图书共创专家，适合把经验、语音、碎片思考整理成一本书。
- `agency-carousel-growth-engine`：轮播增长引擎，适合 TikTok/Instagram 图文轮播内容生产和迭代优化。
- `agency-china-e-commerce-operator`：中国电商运营专家，适合淘宝、天猫、拼多多、京东等平台运营。
- `agency-content-creator`：内容创作专家，适合多平台内容策划、日历、文案和品牌内容生产。
- `agency-cross-border-e-commerce-specialist`：跨境电商专家，适合 Amazon、Shopee、Lazada、独立站等出海运营。
- `agency-douyin-strategist`：抖音策略专家，适合短视频、直播电商和推荐机制打法。
- `agency-growth-hacker`：增长黑客，适合获客实验、增长飞轮、漏斗优化和爆发式增长。
- `agency-instagram-curator`：Instagram 策展专家，适合审美体系、视觉内容和社群互动。
- `agency-kuaishou-strategist`：快手策略专家，适合下沉市场、老铁文化和私域化增长。
- `agency-linkedin-content-creator`：LinkedIn 内容专家，适合职业品牌、思想领导力和 B2B 内容增长。
- `agency-livestream-commerce-coach`：直播电商教练，适合直播脚本、转化结构、主播训练和实时优化。
- `agency-podcast-strategist`：播客策略专家，适合播客定位、分发、增长和音频品牌运营。
- `agency-private-domain-operator`：私域运营专家，适合企微、SCRM、社群和用户生命周期管理。
- `agency-reddit-community-builder`：Reddit 社群运营专家，适合真实互动、社区信任和内容口碑。
- `agency-seo-specialist`：SEO 专家，适合技术 SEO、内容 SEO、权重建设和自然搜索增长。
- `agency-short-video-editing-coach`：短视频剪辑教练，适合 CapCut/Premiere/DaVinci 工作流和后期能力训练。
- `agency-social-media-strategist`：社媒策略专家，适合跨平台社媒矩阵和活动策划。
- `agency-tiktok-strategist`：TikTok 策略专家，适合短视频增长、平台文化和内容爆点。
- `agency-twitter-engager`：Twitter 互动专家，适合实时互动、线程内容和思想领导力运营。
- `agency-wechat-official-account-manager`：微信公众号运营专家，适合内容营销、订阅增长和转化。
- `agency-weibo-strategist`：微博策略专家，适合热点、超话、舆情和平台传播。
- `agency-xiaohongshu-specialist`：小红书专家，适合生活方式内容、美学表达和种草增长。
- `agency-zhihu-strategist`：知乎策略专家，适合知识型内容、问答策略和专业口碑建设。

### 5.6 Paid Media

- `agency-paid-media-auditor`：付费媒体审计专家，适合大规模账户体检、问题诊断和审计报告。
- `agency-ad-creative-strategist`：广告创意策略师，适合广告文案、资产分组和创意测试体系。
- `agency-paid-social-strategist`：付费社交广告策略师，适合 Meta、LinkedIn、TikTok 等社媒广告。
- `agency-ppc-campaign-strategist`：PPC 投放策略师，适合搜索、购物、PMax 和大预算投放架构。
- `agency-programmatic-display-buyer`：程序化与展示广告采购专家，适合展示广告、DSP、ABM Display。
- `agency-search-query-analyst`：搜索词分析专家，适合搜索词挖掘、否词、意图映射和投放优化。
- `agency-tracking-measurement-specialist`：跟踪与归因专家，适合 GTM、GA4、Meta CAPI、转化跟踪与测量。

### 5.7 Product

- `agency-behavioral-nudge-engine`：行为助推专家，适合用行为心理学优化用户互动节奏与动机。
- `agency-feedback-synthesizer`：反馈综合分析师，适合整理多渠道用户反馈并输出产品洞察。
- `agency-product-manager`：产品经理，适合从发现、规划、路线图到上线复盘的完整产品工作。
- `agency-sprint-prioritizer`：冲刺优先级专家，适合 backlog、排期、优先级和资源取舍。
- `agency-trend-researcher`：趋势研究员，适合市场机会、竞争格局和趋势洞察。

### 5.8 Project Management

- `agency-experiment-tracker`：实验跟踪专家，适合 A/B test、实验节奏、结果追踪与验证。
- `agency-jira-workflow-steward`：Jira 工作流守护者，适合 Jira 与 Git 流程的规范化和可追溯性。
- `agency-project-shepherd`：项目 shepherd，适合跨团队推进、里程碑、风险和沟通协调。
- `agency-studio-operations`：工作室运营专家，适合日常流程优化和团队运作支持。
- `agency-studio-producer`：工作室制片人，适合多项目统筹、资源配置和业务/创意对齐。
- `agency-senior-project-manager`：高级项目经理，适合把规格拆成任务、现实排期和交付边界控制。

### 5.9 Sales

- `agency-account-strategist`：客户账户策略师，适合扩单、QBR、关键关系人地图和账户经营。
- `agency-sales-coach`：销售教练，适合销售团队辅导、复盘和行为改进。
- `agency-deal-strategist`：交易策略师，适合复杂 B2B 商机资格判定、竞争策略和赢单规划。
- `agency-discovery-coach`：销售发现教练，适合高质量发现式销售问题设计和通话结构优化。
- `agency-sales-engineer`：售前工程师，适合技术演示、POC 规划、技术答疑和竞争对比。
- `agency-outbound-strategist`：外呼策略师，适合 ICP、触达序列和基于信号的外联获客。
- `agency-pipeline-analyst`：销售管道分析师，适合 CRM 数据、预测、速度和商机健康度分析。
- `agency-proposal-strategist`：方案 / 标书策略师，适合 RFP、提案叙事和赢单材料结构化表达。

### 5.10 Spatial Computing

- `agency-macos-spatial-metal-engineer`：macOS / Metal 空间计算工程师，适合高性能 3D 和原生空间计算体验。
- `agency-terminal-integration-specialist`：终端集成专家，适合终端仿真、文本渲染和终端交互集成。
- `agency-visionos-spatial-engineer`：visionOS 空间工程师，适合 Vision Pro、体积式界面和空间交互。
- `agency-xr-cockpit-interaction-specialist`：XR 驾驶舱交互专家，适合沉浸式控制台 / 仪表盘系统。
- `agency-xr-immersive-developer`：XR 沉浸式开发者，适合 WebXR、浏览器端 AR/VR/XR 应用。
- `agency-xr-interface-architect`：XR 界面架构师，适合空间交互设计与沉浸式界面规划。

### 5.11 Specialized

- `agency-accounts-payable-agent`：应付账款代理，适合支付、账单、付款流和自动化财务动作。
- `agency-agentic-identity-trust-architect`：Agent 身份与信任架构师，适合多 Agent 身份、权限和审计体系设计。
- `agency-agents-orchestrator`：Agent 编排器，适合多角色 / 多步骤流水线的统一调度。
- `agency-automation-governance-architect`：自动化治理架构师，适合业务自动化的价值、风险和治理评估。
- `agency-blockchain-security-auditor`：区块链安全审计师，适合 DeFi / 合约安全审计和漏洞分析。
- `agency-compliance-auditor`：合规审计专家，适合 SOC2、ISO27001、HIPAA、PCI-DSS 等合规准备与审查。
- `agency-corporate-training-designer`：企业培训设计师，适合课程体系、培训项目和培训效果优化。
- `agency-data-consolidation-agent`：数据整合代理，适合把销售 / 报表数据整理进统一看板。
- `agency-government-digital-presales-consultant`：政企数字化售前顾问，适合中国 ToG 项目、标书、合规和方案设计。
- `agency-healthcare-marketing-compliance-specialist`：医疗营销合规专家，适合医药、医疗器械、医美和健康类营销内容风控。
- `agency-identity-graph-operator`：身份图谱运营者，适合多 Agent 场景下实体身份统一与规范解析。
- `agency-lsp-index-engineer`：LSP / 代码索引工程师，适合统一代码智能、语言服务和语义索引系统。
- `agency-recruitment-specialist`：招聘专家，适合招聘流程、平台策略、人才筛选和雇主品牌。
- `agency-report-distribution-agent`：报表分发代理，适合按区域 / 角色自动分发数据报告。
- `agency-sales-data-extraction-agent`：销售数据抽取代理，适合从 Excel 等文件中抽取销售核心指标。
- `agency-cultural-intelligence-strategist`：文化智能策略师，适合跨文化设计、文化偏见识别和国际化表达。
- `agency-developer-advocate`：开发者关系专家，适合开发者社区、DX、技术内容和平台采纳。
- `agency-document-generator`：文档生成专家，适合 PDF、PPTX、DOCX、XLSX 等结构化文件生成。
- `agency-french-consulting-market-navigator`：法国咨询 / 自由职业市场导航专家，适合法国 ESN/SI 生态和合作模式理解。
- `agency-korean-business-navigator`：韩国商业文化导航专家，适合韩国商务沟通、关系维护和文化判断。
- `agency-mcp-builder`：MCP Builder，适合设计、实现和测试 Model Context Protocol 服务器。
- `agency-model-qa-specialist`：模型 QA 专家，适合统计 / ML 模型复现、校准、解释性和审计报告。
- `agency-salesforce-architect`：Salesforce 架构师，适合多云架构、集成、治理和大组织平台设计。
- `agency-workflow-architect`：工作流架构师，适合把系统流程、失败路径、状态流和交互树整理成可执行规格。
- `agency-study-abroad-advisor`：留学顾问，适合多国家留学申请、选校、文书、签证和整体规划。
- `agency-supply-chain-strategist`：供应链策略师，适合采购、供应商体系、制造协同和供应链优化。
- `agency-zk-steward`：Zettelkasten 知识库 steward，适合原子笔记、知识网络和复杂问题拆解。

### 5.12 Support

- `agency-analytics-reporter`：分析报告专家，适合 KPI、看板、统计分析和业务数据洞察。
- `agency-executive-summary-generator`：高管摘要生成器，适合把复杂材料压缩成适合管理层阅读的摘要。
- `agency-finance-tracker`：财务跟踪专家，适合预算、现金流、财务分析和经营健康度判断。
- `agency-infrastructure-maintainer`：基础设施维护专家，适合可靠性、性能、系统运维和成本效率。
- `agency-legal-compliance-checker`：法律合规检查员，适合法务边界、数据合规和业务规范检查。
- `agency-support-responder`：客服响应专家，适合用户支持、工单处理、服务体验和满意度提升。

### 5.13 Testing

- `agency-accessibility-auditor`：无障碍审计师，适合 WCAG、辅助技术、屏幕阅读器和可访问性问题检查。
- `agency-api-tester`：API 测试专家，适合接口验证、性能测试和集成测试。
- `agency-evidence-collector`：证据收集型 QA，适合截图、视觉证据、界面问题留痕和 bug 说明。
- `agency-performance-benchmarker`：性能基准测试专家，适合性能测试、指标对比和优化验证。
- `agency-reality-checker`：现实核验者，适合发布前质量门禁和“是否真的准备好上线”的严谨判断。
- `agency-test-results-analyzer`：测试结果分析师，适合测试结果解读、覆盖率指标和质量分析。
- `agency-tool-evaluator`：工具评估专家，适合软件选型、工具比较和生产力工具评估。
- `agency-workflow-optimizer`：工作流优化专家，适合业务流程、协作流程和自动化效率优化。

### 5.14 agency 使用建议

如果你想让模型“像一个专业角色那样工作”，通常可以按岗位选：

- 做研发：优先 `agency-frontend-developer`、`agency-backend-architect`、`agency-software-architect`
- 做产品：优先 `agency-product-manager`、`agency-sprint-prioritizer`
- 做设计：优先 `agency-ui-designer`、`agency-ux-researcher`、`agency-brand-guardian`
- 做测试：优先 `agency-api-tester`、`agency-accessibility-auditor`、`agency-reality-checker`
- 做增长：优先 `agency-growth-hacker`、`agency-seo-specialist`、`agency-social-media-strategist`
- 做销售 / 商务：优先 `agency-sales-engineer`、`agency-deal-strategist`、`agency-proposal-strategist`

## 6. Codex 自带系统 Skills

当前系统自带 skills 共 `5` 个：

- `imagegen`
  - 用于生成或编辑位图类图片资源，适合做插画、素材、透明背景图和视觉变体。
- `openai-docs`
  - 用于查询和使用 OpenAI 官方文档，适合 OpenAI API、模型选择、官方用法说明等问题。
- `plugin-creator`
  - 用于创建和脚手架化 Codex 插件目录结构。
- `skill-creator`
  - 用于创建新的 Codex skill，适合你自己扩展一套专门能力。
- `skill-installer`
  - 用于从 GitHub 或 curated 列表安装 skill。

## 7. 目录与维护说明

### 7.1 关键目录

- 全局 skill 目录：
  - [~/.codex/skills](/Users/sunlizhou/.codex/skills)
- gstack 使用目录：
  - [~/.claude/skills/gstack](/Users/sunlizhou/.claude/skills/gstack)
- gstack 备份/镜像目录：
  - [~/.skillshub/gstack](/Users/sunlizhou/.skillshub/gstack)
- agency skills 目录：
  - [~/.skillshub](/Users/sunlizhou/.skillshub)
- 当前仓库项目本地 skills：
  - [.codex/skills/README.md](__PROJECT_ROOT__/.codex/skills/README.md)

### 7.2 升级方式建议

- 升级 `gstack`
  - 先核对 [~/.claude/skills/gstack](/Users/sunlizhou/.claude/skills/gstack) 与 [~/.skillshub/gstack](/Users/sunlizhou/.skillshub/gstack) 的当前状态
  - 如需升级，优先按你当前维护流程刷新这两个目录，再重启 Codex
- 升级 `agency-agents`
  - 检查 [~/.skillshub](/Users/sunlizhou/.skillshub) 下对应 `agency-*` 目录
  - 按你当前的同步流程刷新目标 skills 后，再重启 Codex

### 7.3 生效说明

新增或更新全局 skills 之后，通常建议：

- 重启 Codex
- 或重新开启一个新会话

否则有些新装的 skill 可能不会立即出现在当前会话的可发现列表中。

## 8. 一句话总结

你当前这台机器上的 Codex 全局环境，已经具备两套很强的扩展能力：

- `gstack` 负责把研发流程做“深”，适合从需求、评审、QA 到发布的完整流程推进
- `agency-agents` 负责把专家角色做“广”，适合按岗位切换思考方式和输出风格

如果后面你还要继续扩展，我建议优先保持这三层结构：

- 系统内置 skills：负责基础能力
- `gstack-*`：负责流程能力
- `agency-*`：负责角色能力

## 9. 快速索引

这一节不是按“来源”分类，而是按“你现在要做什么”来反查应该先找哪些 agent / skill。

### 9.1 研发与工程类

| 你现在要做什么 | 建议优先使用 |
|---|---|
| 做前端页面 / 组件 / 管理台 | `agency-frontend-developer`、`agency-ui-designer`、`gstack-design-review` |
| 做后端 API / 服务架构 | `agency-backend-architect`、`agency-software-architect`、`gstack-plan-eng-review` |
| 做移动端 App | `agency-mobile-app-builder`、`agency-product-manager` |
| 做 AI 功能 / 模型接入 | `agency-ai-engineer`、`agency-autonomous-optimization-architect` |
| 做数据管道 / 数仓 / ETL | `agency-data-engineer`、`agency-database-optimizer` |
| 做数据库性能优化 | `agency-database-optimizer`、`agency-backend-architect` |
| 做 DevOps / CI/CD / 自动化部署 | `agency-devops-automator`、`gstack-setup-deploy`、`gstack-ship` |
| 做嵌入式 / 固件 / IoT | `agency-embedded-firmware-engineer` |
| 做飞书 / 微信 / 企业集成 | `agency-feishu-integration-developer`、`agency-wechat-mini-program-developer` |
| 只想快速做一个原型 / MVP | `agency-rapid-prototyper`、`agency-product-manager` |
| 做 Git 流程治理 | `agency-git-workflow-master`、`agency-jira-workflow-steward` |
| 做技术文档 / API 文档 | `agency-technical-writer`、`gstack-document-release` |

### 9.2 评审、QA 与发布类

| 你现在要做什么 | 建议优先使用 |
|---|---|
| 重新澄清需求 / 重想方案 | `gstack-office-hours`、`gstack-plan-ceo-review` |
| 做工程方案评审 | `gstack-plan-eng-review`、`agency-software-architect` |
| 做设计方案评审 | `gstack-plan-design-review`、`agency-ui-designer` |
| 做代码审查 | `gstack-review`、`agency-code-reviewer` |
| 做问题调查 / 根因分析 | `gstack-investigate`、`agency-incident-response-commander` |
| 用真实浏览器验证页面 | `gstack-browse`、`gstack-qa` |
| 只输出 QA 报告 | `gstack-qa-only`、`agency-evidence-collector` |
| 做无障碍检查 | `agency-accessibility-auditor`、`gstack-browse` |
| 做 API 测试 | `agency-api-tester` |
| 做性能测试 / 对比 | `gstack-benchmark`、`agency-performance-benchmarker` |
| 做上线前安全检查 | `agency-security-engineer`、`agency-threat-detection-engineer`、`gstack-cso` |
| 准备发版 / 提交 PR / 收口 | `gstack-ship`、`gstack-document-release` |
| 合并后部署与验收 | `gstack-land-and-deploy`、`gstack-canary` |
| 做复盘 | `gstack-retro` |

### 9.3 产品、设计与用户研究类

| 你现在要做什么 | 建议优先使用 |
|---|---|
| 做产品发现 / 明确需求 | `agency-product-manager`、`gstack-office-hours` |
| 做需求优先级 / Sprint 排期 | `agency-sprint-prioritizer` |
| 研究趋势 / 竞品 / 市场机会 | `agency-trend-researcher` |
| 梳理用户反馈 | `agency-feedback-synthesizer` |
| 做 UI 设计 | `agency-ui-designer` |
| 做用户研究 / 可用性研究 | `agency-ux-researcher` |
| 做体验结构 / UX 架构 | `agency-ux-architect` |
| 做品牌系统 | `agency-brand-guardian` |
| 想让产品更有趣、更有记忆点 | `agency-whimsy-injector` |
| 做视觉叙事 / 表达型内容 | `agency-visual-storyteller` |

### 9.4 增长、营销与内容类

| 你现在要做什么 | 建议优先使用 |
|---|---|
| 做整体增长策略 | `agency-growth-hacker` |
| 做内容策划 / 内容矩阵 | `agency-content-creator` |
| 做 SEO | `agency-seo-specialist` |
| 做百度 SEO | `agency-baidu-seo-specialist` |
| 做 AI 搜索 / AI 引用优化 | `agency-ai-citation-strategist` |
| 做 LinkedIn 内容 | `agency-linkedin-content-creator` |
| 做 Twitter / X | `agency-twitter-engager` |
| 做 Instagram | `agency-instagram-curator` |
| 做 TikTok | `agency-tiktok-strategist` |
| 做抖音 | `agency-douyin-strategist` |
| 做快手 | `agency-kuaishou-strategist` |
| 做小红书 | `agency-xiaohongshu-specialist` |
| 做知乎 | `agency-zhihu-strategist` |
| 做微博 | `agency-weibo-strategist` |
| 做 B 站 | `agency-bilibili-content-strategist` |
| 做微信公众号 | `agency-wechat-official-account-manager` |
| 做私域 / 企微 / 社群 | `agency-private-domain-operator` |
| 做直播电商 | `agency-livestream-commerce-coach` |
| 做播客 | `agency-podcast-strategist` |
| 做应用商店优化 | `agency-app-store-optimizer` |
| 做中国电商平台运营 | `agency-china-e-commerce-operator` |
| 做跨境电商 | `agency-cross-border-e-commerce-specialist` |

### 9.5 广告投放、销售与商务类

| 你现在要做什么 | 建议优先使用 |
|---|---|
| 做搜索广告 / PPC 架构 | `agency-ppc-campaign-strategist` |
| 做广告账户审计 | `agency-paid-media-auditor` |
| 做广告创意策略 | `agency-ad-creative-strategist` |
| 做 paid social | `agency-paid-social-strategist` |
| 做程序化展示广告 | `agency-programmatic-display-buyer` |
| 做搜索词挖掘与否词 | `agency-search-query-analyst` |
| 做 tracking / 归因 / GTM / GA4 | `agency-tracking-measurement-specialist` |
| 做售前技术演示 | `agency-sales-engineer` |
| 做复杂 deal 策略 | `agency-deal-strategist` |
| 做外联获客 | `agency-outbound-strategist` |
| 做 proposal / RFP / 标书 | `agency-proposal-strategist` |
| 做销售辅导 / 销售管理 | `agency-sales-coach`、`agency-discovery-coach` |
| 做账户经营 / 扩单 | `agency-account-strategist` |
| 看 pipeline 健康度 / 预测 | `agency-pipeline-analyst` |

### 9.6 运维、组织与专业场景类

| 你现在要做什么 | 建议优先使用 |
|---|---|
| 做项目推进 / 协调 | `agency-project-shepherd`、`agency-senior-project-manager` |
| 做多项目统筹 | `agency-studio-producer` |
| 做流程治理 / 实验管理 | `agency-experiment-tracker`、`agency-workflow-optimizer` |
| 做财务与经营跟踪 | `agency-finance-tracker`、`agency-analytics-reporter` |
| 做法务与合规检查 | `agency-legal-compliance-checker`、`agency-compliance-auditor` |
| 做客服 / 支持流程 | `agency-support-responder` |
| 做基础设施维护 | `agency-infrastructure-maintainer` |
| 做多 Agent 编排 | `agency-agents-orchestrator`、`agency-workflow-architect` |
| 做 MCP 服务开发 | `agency-mcp-builder` |
| 做知识库 / Zettelkasten | `agency-zk-steward` |
| 做 Salesforce 架构 | `agency-salesforce-architect` |
| 做招聘 | `agency-recruitment-specialist` |
| 做中国政企数字化售前 | `agency-government-digital-presales-consultant` |
| 做医疗营销内容风控 | `agency-healthcare-marketing-compliance-specialist` |

### 9.7 游戏与空间计算类

| 你现在要做什么 | 建议优先使用 |
|---|---|
| 做游戏系统 / GDD | `agency-game-designer` |
| 做关卡设计 | `agency-level-designer` |
| 做叙事设计 | `agency-narrative-designer` |
| 做技术美术 / Shader / VFX | `agency-technical-artist` |
| 做游戏音频 | `agency-game-audio-engineer` |
| 做 Vision Pro / visionOS | `agency-visionos-spatial-engineer` |
| 做 WebXR / XR 页面 | `agency-xr-immersive-developer` |
| 做 XR 交互架构 | `agency-xr-interface-architect` |
| 做 macOS + Metal 空间应用 | `agency-macos-spatial-metal-engineer` |
| 做终端集成 / 终端渲染 | `agency-terminal-integration-specialist` |

## 10. 推荐搭配清单

这一节给的是“组合拳”，也就是不是只选一个 agent，而是按任务流组合使用。

### 10.1 从一个模糊需求开始做新功能

推荐顺序：

1. `gstack-office-hours`
2. `gstack-plan-ceo-review`
3. `gstack-plan-eng-review`
4. `agency-product-manager`
5. `agency-software-architect`

适用场景：

- 需求还很模糊
- 目标有，但边界不清楚
- 想先把方向、取舍和落地方案走顺

### 10.2 做一个完整的前端页面 / 后台管理页

推荐组合：

- `agency-frontend-developer`
- `agency-ui-designer`
- `gstack-design-review`
- `gstack-browse`

适用场景：

- React / Vue 页面开发
- 组件、布局、视觉落地
- 页面做完后要真实验证

建议用法：

- 先让 `agency-ui-designer` 定界面方向
- 再让 `agency-frontend-developer` 实现
- 然后用 `gstack-design-review` 找视觉和交互问题
- 最后用 `gstack-browse` 实测

### 10.3 做后端接口 / 服务重构

推荐组合：

- `agency-backend-architect`
- `agency-software-architect`
- `gstack-plan-eng-review`
- `gstack-review`

适用场景：

- 新 API 设计
- 单体拆分 / 服务边界调整
- 数据模型和服务调用链重构

### 10.4 做数据库性能优化

推荐组合：

- `agency-database-optimizer`
- `agency-backend-architect`
- `gstack-investigate`

适用场景：

- 慢 SQL
- 索引问题
- 数据库 schema 不合理
- 线上性能问题需要定位根因

### 10.5 做线上问题排查 / 故障响应

推荐组合：

- `gstack-investigate`
- `agency-incident-response-commander`
- `agency-infrastructure-maintainer`
- `gstack-retro`

适用场景：

- 出现故障但根因不明
- 需要快速整理事实、排查路径和后续复盘

### 10.6 做代码审查 + 发布前质量把关

推荐组合：

- `gstack-review`
- `agency-code-reviewer`
- `agency-reality-checker`
- `agency-accessibility-auditor`
- `gstack-ship`

适用场景：

- 功能已经开发完成
- 想在发版前做更完整的质量门禁

### 10.7 做真实浏览器 QA 验证

推荐组合：

- `gstack-browse`
- `gstack-qa`
- `agency-evidence-collector`
- `agency-performance-benchmarker`

适用场景：

- 需要登录态检查页面
- 需要视觉证据
- 需要同时看功能和性能

### 10.8 做安全审查

推荐组合：

- `agency-security-engineer`
- `agency-threat-detection-engineer`
- `gstack-cso`
- `gstack-careful`

适用场景：

- 上线前安全检查
- 敏感功能评审
- 想降低危险命令和高风险操作

### 10.9 做产品发现 + 用户反馈整理

推荐组合：

- `agency-product-manager`
- `agency-feedback-synthesizer`
- `agency-ux-researcher`
- `gstack-plan-ceo-review`

适用场景：

- 用户反馈很多但不知道怎么归纳
- 要做 roadmap / 优先级决策
- 需要从用户问题反推产品方向

### 10.10 做内容增长 / SEO / 社媒矩阵

推荐组合：

- `agency-growth-hacker`
- `agency-content-creator`
- `agency-seo-specialist`
- `agency-social-media-strategist`
- `agency-ai-citation-strategist`

适用场景：

- 想同时做搜索、内容、社媒和 AI 可见性
- 想搭建持续增长内容体系

### 10.11 做广告投放体系

推荐组合：

- `agency-ppc-campaign-strategist`
- `agency-tracking-measurement-specialist`
- `agency-search-query-analyst`
- `agency-ad-creative-strategist`
- `agency-paid-media-auditor`

适用场景：

- 新广告账户搭建
- 存量账户优化
- 广告效果差但原因不明

### 10.12 做 B2B 销售支持

推荐组合：

- `agency-sales-engineer`
- `agency-deal-strategist`
- `agency-proposal-strategist`
- `agency-account-strategist`

适用场景：

- 售前支持
- 复杂 deal 推进
- 标书 / RFP / 提案准备
- 中标后的客户深耕

### 10.13 做项目管理 / 多角色推进

推荐组合：

- `agency-project-shepherd`
- `agency-senior-project-manager`
- `agency-jira-workflow-steward`
- `agency-workflow-architect`
- `agency-agents-orchestrator`

适用场景：

- 任务多、角色多、交接多
- 想把需求、任务、Git、流程统一起来

### 10.14 做游戏 / XR 项目

推荐组合：

- 游戏方向：
  - `agency-game-designer`
  - `agency-level-designer`
  - `agency-narrative-designer`
  - `agency-technical-artist`
- XR / visionOS 方向：
  - `agency-xr-interface-architect`
  - `agency-xr-immersive-developer`
  - `agency-visionos-spatial-engineer`
  - `agency-macos-spatial-metal-engineer`

适用场景：

- 游戏设计与落地协同
- XR 空间计算产品设计与开发

### 10.15 我该优先用哪类组合

如果你只想快速判断，可以先这么选：

- 做代码交付：`gstack + engineering`
- 做产品方案：`gstack + product`
- 做设计表达：`design + gstack-design-review`
- 做测试验收：`gstack-browse + gstack-qa + testing`
- 做增长营销：`marketing + paid-media`
- 做组织推进：`project-management + specialized`

## 11. 使用建议

如果你不确定先用哪个，建议从下面这个最稳的起手式开始：

1. 先用一个 `agency-*` 角色确定“谁来想”
2. 再用一个 `gstack-*` skill 决定“按什么流程推进”
3. 做完后再用 `gstack-review` / `gstack-qa` 兜底

一个最常见的通用模板是：

```text
agency-frontend-developer
+ gstack-plan-eng-review
+ gstack-review
+ gstack-browse
```

或者：

```text
agency-product-manager
+ gstack-office-hours
+ gstack-plan-ceo-review
+ gstack-plan-eng-review
```

## 12. 项目开发阶段中的使用规则

这一节不是重新定义项目开发规范，而是补充说明：

- 在本项目里，真正的开发总入口仍然是 [开发规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/开发规范.md)
- 本文件负责回答“有哪些 agent / skill、分别适合做什么、开发时应该选谁、审查时应该选谁”

可以这样理解两份文档的分工：

- [开发规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/开发规范.md)
  - 负责“开发阶段必须遵守什么规则”
- [全局Agent与Skill说明.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md)
  - 负责“开发或审查时，agent / skill 应该怎么选”

### 12.1 什么时候需要看这份文档

平时 AI 不需要每次任务都完整重读本文件。

通常在以下场景按需阅读即可：

1. 进入正式开发前，需要选择主开发 agent
2. 开发完成后，需要选择代码审查 agent
3. 任务涉及多 agent 协作，需要判断如何搭配
4. agent / skill 本身有新增、删减、升级或路由变化
5. 不确定某类任务应该优先用 `agency-*`、`gstack-*` 还是 `.system/*`

### 12.2 开发时如何选主开发 agent

在本项目中，正式开发时默认自动选择 `1` 个主开发 agent。

推荐口径如下：

- 前端页面、壳层、交互、组件开发：
  - 优先 `agency-frontend-developer`
- 后端接口、服务边界、数据结构开发：
  - 优先 `agency-backend-architect`
- 跨模块、跨前后端、结构性重构：
  - 先用 `agency-software-architect` 做结构把关
  - 再确定主开发 agent
- 快速原型、POC、极速验证：
  - 优先 `agency-rapid-prototyper`

补充原则：

- 一个开发任务只保留一个主开发 agent
- 其他 agent 可以协同，但不替代主开发 agent
- 主开发 agent 的选择，应由任务类型决定，而不是由临时偏好决定

### 12.3 开发完成后如何选审查 agent

在本项目中，开发结束后默认自动再选择 `1` 个合适的审查 agent 做代码审核。

默认优先：

- `agency-code-reviewer`

按专项风险追加：

- 架构或跨模块风险：
  - `gstack-review`
  - `agency-software-architect`
- 安全风险：
  - `agency-security-engineer`
- UI 一致性风险：
  - `agency-ui-designer`
  - `gstack-design-review`
- 性能风险：
  - `agency-performance-benchmarker`

补充原则：

- 审查 agent 不应与主开发 agent 完全重合
- 审查重点优先看正确性、回归风险、范围漂移和缺失文档回填

### 12.4 开发超过 8 分钟后的效率复盘协作

在本项目中，如果一次正式开发累计超过 `8` 分钟，收尾前还要做效率复盘。

默认协作口径：

- 主线程先本地完成首轮复盘，明确代码、架构、文档、流程、agent 协作、验证收尾六个维度的问题
- 如果需要补充流程优化视角，可参考：
  - `agency-workflow-optimizer`
  - `agency-project-shepherd`
  - `gstack-retro`
- 如果需要补充多 agent 分工优化视角，可参考：
  - `agency-agents-orchestrator`
  - `agency-workflow-architect`

补充原则：

- 效率复盘的主责任仍在主线程，不把复盘完全外包给 agent
- agent 更适合补充“流程怎么更顺、协作怎么更省、哪些动作可模板化”
- agent 运行期间，主线程优先做明确不重叠的本地工作，减少碎片化短轮询
- 对承担实质性任务的子 agent，首次等待窗口默认 `10` 分钟起步；构建、测试、联调、大实现或大文档整理类任务，默认用更长等待窗口，不再频繁短轮询
- 如果复盘结论改变了 agent / skill 的默认选型或协作方式，必须同步更新本文件
- 如果同一关键路径上连续出现 `stream disconnected`、`429`、`503` 这类平台级 agent 故障，默认不再串行追加多个 reviewer 重试；主线程先切回本地收口，再在稳定结果上补 `1` 个替代复核
- 对部署、发版、升级 SQL、联调排障类任务，reviewer agent 更适合审剩余风险，不适合替代主线程完成基础预检；主线程应先做目标环境、关键脚本和最小验证链路的无副作用检查

### 12.5 如果 agent 或 skill 发生变化

只要发生以下情况，就应同步更新本文件：

- 新增了可用 agent
- 删除了原有 agent / skill
- 调整了某个 agent / skill 的推荐用途
- 调整了开发 agent 或审查 agent 的默认选型规则
- 调整了多 agent 搭配方式

这条规则的意思是：

- [开发规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/开发规范.md) 负责规定“开发时要不要自动选 agent”
- 本文件负责记录“具体应该选哪个 agent / skill”

所以后续只要 agent / skill 体系变化，本文件必须同步补充修改。

## 13. 项目专属 Skills 与 Hooks

除了全局安装的 `gstack-*`、`agency-*` 和 `.system/*` 外，本项目还在仓库内维护了项目本地 AI 执行层。

当前项目本地 AI 执行层分成三块：

1. `.codex/skills/`：当前默认主入口，只放项目 adapter skills
2. `.claude/skills/`：历史保留、仍可复用的辅助 skills，默认不作为主入口
3. `.claude/scripts/ai-exec-hooks/`：只负责提醒、检查、收集的轻量 hooks，不承接权威规则正文

### 13.1 `.codex/skills/` 主 adapter 清单

| Skill | 用途 | 触发场景 |
|-------|------|----------|
| `project-ai-doc-ops` | 项目总入口，负责阅读路径、任务分型、门禁节奏与复核闭环 | 几乎所有正式仓库任务的起步阶段 |
| `project-doc-governance` | 文档治理专项，负责正式文档路由、实施门禁与文档评审闭环 | 写需求、规则、UI、实施、数据库/API 文档或进入代码前的治理判断 |

项目本地 skill 索引见：

- [.codex/skills/README.md](__PROJECT_ROOT__/.codex/skills/README.md)
- [.claude/skills/README.md](__PROJECT_ROOT__/.claude/skills/README.md)
- [.claude/scripts/ai-exec-hooks/README.md](__PROJECT_ROOT__/.claude/scripts/ai-exec-hooks/README.md)

### 13.2 分层关系

当前项目本地 AI 执行层已经拆成三层：

- 全局 core skills：放在 `~/.codex/skills/`，负责跨项目可复用的方法论骨架
- 项目 adapter skills：放在仓库 `.codex/skills/`，负责当前项目的真实路径、真实文档入口和项目细则
- 项目辅助 skills：放在仓库 `.claude/skills/`，负责补充性提醒、历史试点保留和局部辅助，不替代主 adapter
- 项目轻量 hooks：放在仓库 `.claude/scripts/ai-exec-hooks/`，负责启动检查、门禁提醒、收尾提醒和候选收集

当前推荐对应关系：

- `ai-doc-ops-core` -> `project-ai-doc-ops`
- `doc-governance-core` -> `project-doc-governance`

执行原则：

- 换项目时，优先复用全局 core，重写项目 adapter
- 换电脑时，先同步全局 core skills，再拉取具体仓库中的项目 adapter
- 通用方法论升级，优先更新全局 core；项目落地规则升级，优先更新项目 adapter；跨层规则才双向同步

权威源边界：

- 正式规则正文优先写在 `doc/01-规范标准/` 或 `doc/02-标准操作手册/`
- 项目 adapter skill 负责把 AI 路由到正确入口，并提醒门禁与协作节奏
- `.claude/skills/` 只做辅助层，不应与 `.codex/skills/` 争夺默认入口
- hooks 只做提醒、检查、收集，不自动改正式规则、不自动下最终结论
- project skill 不应与正式文档平行维护同一条完整规则
- 如果 agent / skill 行为升级会影响正式口径，先更新正式文档，再更新 skill，再补升级日志

对应规则见：

- [文档、SOP、模板与Skill职责边界规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/文档、SOP、模板与Skill职责边界规范.md)
- [文档与skill去重治理规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/文档与skill去重治理规范.md)

### 13.3 `.codex/skills/` 主 adapter 说明

#### project-ai-doc-ops

用于 `__PROJECT_NAME__` 仓库任务的总入口 adapter。

核心原则：

- 先继承全局 `ai-doc-ops-core` 的通用骨架
- 先按入口链建立上下文，再决定往哪类正式文档或执行阶段推进
- 先判定任务属于文档治理、预览先行、数据库/API 设计、实施开发、SOP 执行还是问题排查
- 遇到问题修复或缺陷收口时，先判断主归档层是当前版本包、`04-问题总结/`、`05-升级日志/` 还是 `02-标准操作手册/`
- 关键产出默认采用“主 agent + 独立复核 agent + 主线程收口”
- 影响既有正式页面时，先走预览页与 UI 确认，再进入数据库/API 与实施文档阶段

详细规则见：[.codex/skills/project-ai-doc-ops/SKILL.md](__PROJECT_ROOT__/.codex/skills/project-ai-doc-ops/SKILL.md)

#### project-doc-governance

用于 `__PROJECT_NAME__` 仓库正式文档治理和实施门禁 adapter。

核心原则：

- 先继承全局 `doc-governance-core` 的通用治理骨架
- 正式文档必须路由到新的分层 `doc/` 结构
- 没有已确认实施文档，不进入正式代码修改
- 需求、规则、UI、数据库/API、实施文档等关键正式输出，默认都要独立复核
- 问题修复文档默认先做归档判定，不把单个 Bug 直接升级成新版本包
- 既有正式页面改动遵循预览先行、页面确认后再进数据库/API 的节奏

详细规则见：[.codex/skills/project-doc-governance/SKILL.md](__PROJECT_ROOT__/.codex/skills/project-doc-governance/SKILL.md)

### 13.4 `.claude/skills/` 辅助层说明

当前 `.claude/skills/` 默认按状态分两类管理：

- `辅助可用`：仍可在当前流程中按需补充使用
- `历史试点 / 非默认`：只保留追溯价值，不作为当前默认调用入口

当前使用原则：

- 先走 `.codex/skills/` 主 adapter
- 再按需补 `.claude/skills/` 的辅助 skill
- 如果辅助 skill 与正式文档或 `.codex/skills/` 主 adapter 冲突，以正式文档和主 adapter 为准

### 13.5 项目专属 Skills 与全局 Skills 配合

推荐顺序：

1. 先用全局 core skill 明确通用方法论骨架
2. 再用项目专属 adapter skill 落到当前仓库的真实规则
3. 再用全局 `agency-*` 选择专业角色
4. 再用全局 `gstack-*` 选择流程技能
5. 最后用项目专属 skill 完成复盘和回填

典型组合示例：

#### 开发任务组合

```text
ai-doc-ops-core（全局 core）→ 确认文档优先与阶段分型骨架
project-ai-doc-ops（项目专属）→ 定位任务与入口链
doc-governance-core（全局 core）→ 确认正式文档门禁骨架
project-doc-governance（项目专属）→ 确认文档路由与实施门禁
agency-frontend-developer（全局）→ 执行开发
gstack-review（全局）→ 代码审查
project-ai-doc-ops（项目专属）→ 复盘与回填收口
```

#### 需求修改组合

```text
ai-doc-ops-core（全局 core）→ 判断任务阶段骨架
project-ai-doc-ops（项目专属）→ 判断任务分型
doc-governance-core（全局 core）→ 确认正式文档与评审骨架
project-doc-governance（项目专属）→ 需求 / 页面规则 / 实施文档路由
agency-product-manager（全局）→ 补充产品视角
gstack-plan-design-review（全局）→ 独立复核
project-ai-doc-ops（项目专属）→ 决定是否进入预览或下一阶段
```

#### 探索任务组合

```text
ai-doc-ops-core（全局 core）→ 定位总流程骨架
project-ai-doc-ops（项目专属）→ 定位入口与任务类别
[探索动作]
doc-governance-core（全局 core）→ 提供回填门禁骨架
project-doc-governance（项目专属）→ 判断回填位置
project-ai-doc-ops（项目专属）→ 回填与收口
```

### 13.6 项目本地目录位置

- 主 adapter：[.codex/skills/](__PROJECT_ROOT__/.codex/skills/)
- 辅助 skills：[.claude/skills/](__PROJECT_ROOT__/.claude/skills/)
- 轻量 hooks：[.claude/scripts/ai-exec-hooks/](__PROJECT_ROOT__/.claude/scripts/ai-exec-hooks/)
- 本地索引：
  - [.codex/skills/README.md](__PROJECT_ROOT__/.codex/skills/README.md)
  - [.claude/skills/README.md](__PROJECT_ROOT__/.claude/skills/README.md)
  - [.claude/scripts/ai-exec-hooks/README.md](__PROJECT_ROOT__/.claude/scripts/ai-exec-hooks/README.md)

### 13.7 项目专属 Skills 与 Hooks 维护规则

- 新增 `.codex/skills/` 或 `.claude/skills/` 条目后，更新本章节与对应 README
- Skill 内容变化后，同步更新对应 `SKILL.md`
- Hook 清单变化后，同步更新 hooks README 与挂载配置
- 如变更影响正式规则，同步更新正式文档与 AI 规则升级日志
- 历史试点 skill 默认先标记为 `历史试点 / 非默认`，确认无引用后再移除
- 与全局 skill 有重叠或冲突时，优先以正式文档为准，再判断是否保留项目本地 skill / hook
