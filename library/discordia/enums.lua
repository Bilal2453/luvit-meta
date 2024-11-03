---@meta _

---@alias discordia.enums.actionType_key
---|"guildUpdate" # 1
---|"channelCreate" # 10
---|"channelUpdate" # 11
---|"channelDelete" # 12
---|"channelOverwriteCreate" # 13
---|"channelOverwriteUpdate" # 14
---|"channelOverwriteDelete" # 15
---|"memberKick" # 20
---|"memberPrune" # 21
---|"memberBanAdd" # 22
---|"memberBanRemove" # 23
---|"memberUpdate" # 24
---|"memberRoleUpdate" # 25
---|"memberMove" # 26
---|"memberDisconnect" # 27
---|"botAdd" # 28
---|"roleCreate" # 30
---|"roleUpdate" # 31
---|"roleDelete" # 32
---|"inviteCreate" # 40
---|"inviteUpdate" # 41
---|"inviteDelete" # 42
---|"webhookCreate" # 50
---|"webhookUpdate" # 51
---|"webhookDelete" # 52
---|"emojiCreate" # 60
---|"emojiUpdate" # 61
---|"emojiDelete" # 62
---|"messageDelete" # 72
---|"messageBulkDelete" # 73
---|"messagePin" # 74
---|"messageUnpin" # 75
---|"integrationCreate" # 80
---|"integrationUpdate" # 81
---|"integrationDelete" # 82
---|"stageInstanceCreate" # 83
---|"stageInstanceUpdate" # 84
---|"stageInstanceDelete" # 85
---|"stickerCreate" # 90
---|"stickerUpdate" # 91
---|"stickerDelete" # 92
---|"eventCreate" # 100
---|"eventUpdate" # 101
---|"eventDelete" # 102
---|"threadCreate" # 110
---|"threadUpdate" # 111
---|"threadDelete" # 112
---|"autoModRuleCreate" # 140
---|"autoModRuleUpdate" # 141
---|"autoModRuleDelete" # 142
---|"autoModMessageBlock" # 143
---|"autoModMessageFlag" # 144
---|"autoModUserTimeout" # 145

---@alias discordia.enums.actionType_value
---|1 # guildUpdate
---|10 # channelCreate
---|11 # channelUpdate
---|12 # channelDelete
---|13 # channelOverwriteCreate
---|14 # channelOverwriteUpdate
---|15 # channelOverwriteDelete
---|20 # memberKick
---|21 # memberPrune
---|22 # memberBanAdd
---|23 # memberBanRemove
---|24 # memberUpdate
---|25 # memberRoleUpdate
---|26 # memberMove
---|27 # memberDisconnect
---|28 # botAdd
---|30 # roleCreate
---|31 # roleUpdate
---|32 # roleDelete
---|40 # inviteCreate
---|41 # inviteUpdate
---|42 # inviteDelete
---|50 # webhookCreate
---|51 # webhookUpdate
---|52 # webhookDelete
---|60 # emojiCreate
---|61 # emojiUpdate
---|62 # emojiDelete
---|72 # messageDelete
---|73 # messageBulkDelete
---|74 # messagePin
---|75 # messageUnpin
---|80 # integrationCreate
---|81 # integrationUpdate
---|82 # integrationDelete
---|83 # stageInstanceCreate
---|84 # stageInstanceUpdate
---|85 # stageInstanceDelete
---|90 # stickerCreate
---|91 # stickerUpdate
---|92 # stickerDelete
---|100 # eventCreate
---|101 # eventUpdate
---|102 # eventDelete
---|110 # threadCreate
---|111 # threadUpdate
---|112 # threadDelete
---|140 # autoModRuleCreate
---|141 # autoModRuleUpdate
---|142 # autoModRuleDelete
---|143 # autoModMessageBlock
---|144 # autoModMessageFlag
---|145 # autoModUserTimeout

---@class discordia.enums.actionType: table
---@overload fun(k: discordia.enums.actionType_value): discordia.enums.actionType_key
local actionType = {
	guildUpdate = 1,
	channelCreate = 10,
	channelUpdate = 11,
	channelDelete = 12,
	channelOverwriteCreate = 13,
	channelOverwriteUpdate = 14,
	channelOverwriteDelete = 15,
	memberKick = 20,
	memberPrune = 21,
	memberBanAdd = 22,
	memberBanRemove = 23,
	memberUpdate = 24,
	memberRoleUpdate = 25,
	memberMove = 26,
	memberDisconnect = 27,
	botAdd = 28,
	roleCreate = 30,
	roleUpdate = 31,
	roleDelete = 32,
	inviteCreate = 40,
	inviteUpdate = 41,
	inviteDelete = 42,
	webhookCreate = 50,
	webhookUpdate = 51,
	webhookDelete = 52,
	emojiCreate = 60,
	emojiUpdate = 61,
	emojiDelete = 62,
	messageDelete = 72,
	messageBulkDelete = 73,
	messagePin = 74,
	messageUnpin = 75,
	integrationCreate = 80,
	integrationUpdate = 81,
	integrationDelete = 82,
	stageInstanceCreate = 83,
	stageInstanceUpdate = 84,
	stageInstanceDelete = 85,
	stickerCreate = 90,
	stickerUpdate = 91,
	stickerDelete = 92,
	eventCreate = 100,
	eventUpdate = 101,
	eventDelete = 102,
	threadCreate = 110,
	threadUpdate = 111,
	threadDelete = 112,
	autoModRuleCreate = 140,
	autoModRuleUpdate = 141,
	autoModRuleDelete = 142,
	autoModMessageBlock = 143,
	autoModMessageFlag = 144,
	autoModUserTimeout = 145,
}

---@alias discordia.enums.activityType_key
---|"default" # 0
---|"streaming" # 1
---|"listening" # 2
---|"watching" # 3
---|"custom" # 4
---|"competing" # 5

---@alias discordia.enums.activityType_value
---|0 # default
---|1 # streaming
---|2 # listening
---|3 # watching
---|4 # custom
---|5 # competing

---@class discordia.enums.activityType: table
---@overload fun(k: discordia.enums.activityType_value): discordia.enums.activityType_key
local activityType = {
	default = 0,
	streaming = 1,
	listening = 2,
	watching = 3,
	custom = 4,
	competing = 5,
}

---@alias discordia.enums.channelType_key
---|"text" # 0
---|"private" # 1
---|"voice" # 2
---|"group" # 3
---|"category" # 4
---|"news" # 5
---|"store" # 6
---|"newsThread" # 10
---|"publicThread" # 11
---|"privateThread" # 12
---|"stageVoice" # 13
---|"directory" # 14
---|"forum" # 15
---|"media" # 16

---@alias discordia.enums.channelType_value
---|0 # text
---|1 # private
---|2 # voice
---|3 # group
---|4 # category
---|5 # news
---|6 # store
---|10 # newsThread
---|11 # publicThread
---|12 # privateThread
---|13 # stageVoice
---|14 # directory
---|15 # forum
---|16 # media

---@class discordia.enums.channelType: table
---@overload fun(k: discordia.enums.channelType_value): discordia.enums.channelType_key
local channelType = {
	text = 0,
	private = 1,
	voice = 2,
	group = 3,
	category = 4,
	news = 5,
	store = 6,
	newsThread = 10,
	publicThread = 11,
	privateThread = 12,
	stageVoice = 13,
	directory = 14,
	forum = 15,
	media = 16,
}

---@alias discordia.enums.defaultAvatar_key
---|"blurple" # 0
---|"gray" # 1
---|"green" # 2
---|"orange" # 3
---|"red" # 4
---|"pink" # 5

---@alias discordia.enums.defaultAvatar_value
---|0 # blurple
---|1 # gray
---|2 # green
---|3 # orange
---|4 # red
---|5 # pink

---@class discordia.enums.defaultAvatar: table
---@overload fun(k: discordia.enums.defaultAvatar_value): discordia.enums.defaultAvatar_key
local defaultAvatar = {
	blurple = 0,
	gray = 1,
	green = 2,
	orange = 3,
	red = 4,
	pink = 5,
}

---@alias discordia.enums.explicitContentLevel_key
---|"none" # 0
---|"medium" # 1
---|"high" # 2

---@alias discordia.enums.explicitContentLevel_value
---|0 # none
---|1 # medium
---|2 # high

---@class discordia.enums.explicitContentLevel: table
---@overload fun(k: discordia.enums.explicitContentLevel_value): discordia.enums.explicitContentLevel_key
local explicitContentLevel = {
	none = 0,
	medium = 1,
	high = 2,
}

---@alias discordia.enums.gameType_key
---|"default" # 0
---|"streaming" # 1
---|"listening" # 2
---|"watching" # 3
---|"custom" # 4
---|"competing" # 5

---@alias discordia.enums.gameType_value
---|0 # default
---|1 # streaming
---|2 # listening
---|3 # watching
---|4 # custom
---|5 # competing

---@class discordia.enums.gameType: table
---@overload fun(k: discordia.enums.gameType_value): discordia.enums.gameType_key
local gameType = {
	default = 0,
	streaming = 1,
	listening = 2,
	watching = 3,
	custom = 4,
	competing = 5,
}

---@alias discordia.enums.gatewayIntent_key
---|"guilds" # 0x1
---|"guildMembers" # 0x2
---|"guildModeration" # 0x4
---|"guildEmojis" # 0x8
---|"guildIntegrations" # 0x10
---|"guildWebhooks" # 0x20
---|"guildInvites" # 0x40
---|"guildVoiceStates" # 0x80
---|"guildPresences" # 0x100
---|"guildMessages" # 0x200
---|"guildMessageReactions" # 0x400
---|"guildMessageTyping" # 0x800
---|"directMessage" # 0x1000
---|"directMessageRections" # 0x2000
---|"directMessageTyping" # 0x4000
---|"messageContent" # 0x8000
---|"guildScheduledEvents" # 0x10000
---|"autoModConfiguration" # 0x100000
---|"autoModExecution" # 0x200000

---@alias discordia.enums.gatewayIntent_value
---|1 # guilds
---|2 # guildMembers
---|4 # guildModeration
---|8 # guildEmojis
---|16 # guildIntegrations
---|32 # guildWebhooks
---|64 # guildInvites
---|128 # guildVoiceStates
---|256 # guildPresences
---|512 # guildMessages
---|1024 # guildMessageReactions
---|2048 # guildMessageTyping
---|4096 # directMessage
---|8192 # directMessageRections
---|16384 # directMessageTyping
---|32768 # messageContent
---|65536 # guildScheduledEvents
---|1048576 # autoModConfiguration
---|2097152 # autoModExecution

---@class discordia.enums.gatewayIntent: table
---@overload fun(k: discordia.enums.gatewayIntent_value): discordia.enums.gatewayIntent_key
local gatewayIntent = {
	guilds = 1,
	guildMembers = 2,
	guildModeration = 4,
	guildEmojis = 8,
	guildIntegrations = 16,
	guildWebhooks = 32,
	guildInvites = 64,
	guildVoiceStates = 128,
	guildPresences = 256,
	guildMessages = 512,
	guildMessageReactions = 1024,
	guildMessageTyping = 2048,
	directMessage = 4096,
	directMessageRections = 8192,
	directMessageTyping = 16384,
	messageContent = 32768,
	guildScheduledEvents = 65536,
	autoModConfiguration = 1048576,
	autoModExecution = 2097152,
}

---@alias discordia.enums.logLevel_key
---|"none" # 0
---|"error" # 1
---|"warning" # 2
---|"info" # 3
---|"debug" # 4

---@alias discordia.enums.logLevel_value
---|0 # none
---|1 # error
---|2 # warning
---|3 # info
---|4 # debug

---@class discordia.enums.logLevel: table
---@overload fun(k: discordia.enums.logLevel_value): discordia.enums.logLevel_key
local logLevel = {
	none = 0,
	error = 1,
	warning = 2,
	info = 3,
	debug = 4,
}

---@alias discordia.enums.messageFlag_key
---|"crossposted" # 0x1
---|"isCrosspost" # 0x2
---|"suppressEmbeds" # 0x4
---|"sourceMessageDeleted" # 0x8
---|"urgent" # 0x10
---|"hasThread" # 0x20
---|"ephemeral" # 0x40
---|"loading" # 0x80
---|"threadFailedToMentionRoles" # 0x100
---|"suppressNotification" # 0x1000
---|"isVoiceMessage" # 0x2000

---@alias discordia.enums.messageFlag_value
---|1 # crossposted
---|2 # isCrosspost
---|4 # suppressEmbeds
---|8 # sourceMessageDeleted
---|16 # urgent
---|32 # hasThread
---|64 # ephemeral
---|128 # loading
---|256 # threadFailedToMentionRoles
---|4096 # suppressNotification
---|8192 # isVoiceMessage

---@class discordia.enums.messageFlag: table
---@overload fun(k: discordia.enums.messageFlag_value): discordia.enums.messageFlag_key
local messageFlag = {
	crossposted = 1,
	isCrosspost = 2,
	suppressEmbeds = 4,
	sourceMessageDeleted = 8,
	urgent = 16,
	hasThread = 32,
	ephemeral = 64,
	loading = 128,
	threadFailedToMentionRoles = 256,
	suppressNotification = 4096,
	isVoiceMessage = 8192,
}

---@alias discordia.enums.messageType_key
---|"default" # 0
---|"recipientAdd" # 1
---|"recipientRemove" # 2
---|"call" # 3
---|"channelNameChange" # 4
---|"channelIconchange" # 5
---|"pinnedMessage" # 6
---|"memberJoin" # 7
---|"premiumGuildSubscription" # 8
---|"premiumGuildSubscriptionTier1" # 9
---|"premiumGuildSubscriptionTier2" # 10
---|"premiumGuildSubscriptionTier3" # 11
---|"channelFollowAdd" # 12
---|"guildDiscoveryDisqualified" # 14
---|"guildDiscoveryRequalified" # 15
---|"guildDiscoveryInitialWarning" # 16
---|"guildDiscoveryFinalWarning" # 17
---|"threadCreated" # 18
---|"reply" # 19
---|"chatInputCommand" # 20
---|"threadStarterMessage" # 21
---|"guildInviteReminder" # 22
---|"contextMenuCommand" # 23
---|"autoModerationAction" # 24
---|"roleSubscriptionPurchase" # 25
---|"interactionPremiumUpsell" # 26
---|"stageStart" # 27
---|"stageEnd" # 28
---|"stageSpeaker" # 29
---|"stageTopic" # 31
---|"applicationPremiumSubscription" # 32

---@alias discordia.enums.messageType_value
---|0 # default
---|1 # recipientAdd
---|2 # recipientRemove
---|3 # call
---|4 # channelNameChange
---|5 # channelIconchange
---|6 # pinnedMessage
---|7 # memberJoin
---|8 # premiumGuildSubscription
---|9 # premiumGuildSubscriptionTier1
---|10 # premiumGuildSubscriptionTier2
---|11 # premiumGuildSubscriptionTier3
---|12 # channelFollowAdd
---|14 # guildDiscoveryDisqualified
---|15 # guildDiscoveryRequalified
---|16 # guildDiscoveryInitialWarning
---|17 # guildDiscoveryFinalWarning
---|18 # threadCreated
---|19 # reply
---|20 # chatInputCommand
---|21 # threadStarterMessage
---|22 # guildInviteReminder
---|23 # contextMenuCommand
---|24 # autoModerationAction
---|25 # roleSubscriptionPurchase
---|26 # interactionPremiumUpsell
---|27 # stageStart
---|28 # stageEnd
---|29 # stageSpeaker
---|31 # stageTopic
---|32 # applicationPremiumSubscription

---@class discordia.enums.messageType: table
---@overload fun(k: discordia.enums.messageType_value): discordia.enums.messageType_key
local messageType = {
	default = 0,
	recipientAdd = 1,
	recipientRemove = 2,
	call = 3,
	channelNameChange = 4,
	channelIconchange = 5,
	pinnedMessage = 6,
	memberJoin = 7,
	premiumGuildSubscription = 8,
	premiumGuildSubscriptionTier1 = 9,
	premiumGuildSubscriptionTier2 = 10,
	premiumGuildSubscriptionTier3 = 11,
	channelFollowAdd = 12,
	guildDiscoveryDisqualified = 14,
	guildDiscoveryRequalified = 15,
	guildDiscoveryInitialWarning = 16,
	guildDiscoveryFinalWarning = 17,
	threadCreated = 18,
	reply = 19,
	chatInputCommand = 20,
	threadStarterMessage = 21,
	guildInviteReminder = 22,
	contextMenuCommand = 23,
	autoModerationAction = 24,
	roleSubscriptionPurchase = 25,
	interactionPremiumUpsell = 26,
	stageStart = 27,
	stageEnd = 28,
	stageSpeaker = 29,
	stageTopic = 31,
	applicationPremiumSubscription = 32,
}

---@alias discordia.enums.notificationSetting_key
---|"allMessages" # 0
---|"onlyMentions" # 1

---@alias discordia.enums.notificationSetting_value
---|0 # allMessages
---|1 # onlyMentions

---@class discordia.enums.notificationSetting: table
---@overload fun(k: discordia.enums.notificationSetting_value): discordia.enums.notificationSetting_key
local notificationSetting = {
	allMessages = 0,
	onlyMentions = 1,
}

---@alias discordia.enums.permission_key
---|"createInstantInvite" # 0x1
---|"kickMembers" # 0x2
---|"banMembers" # 0x4
---|"administrator" # 0x8
---|"manageChannels" # 0x10
---|"manageGuild" # 0x20
---|"addReactions" # 0x40
---|"viewAuditLog" # 0x80
---|"prioritySpeaker" # 0x100
---|"stream" # 0x200
---|"readMessages" # 0x400
---|"sendMessages" # 0x800
---|"sendTextToSpeech" # 0x1000
---|"manageMessages" # 0x2000
---|"embedLinks" # 0x4000
---|"attachFiles" # 0x8000
---|"readMessageHistory" # 0x10000
---|"mentionEveryone" # 0x20000
---|"useExternalEmojis" # 0x40000
---|"viewGuildInsights" # 0x80000
---|"connect" # 0x100000
---|"speak" # 0x200000
---|"muteMembers" # 0x400000
---|"deafenMembers" # 0x800000
---|"moveMembers" # 0x1000000
---|"useVoiceActivity" # 0x2000000
---|"changeNickname" # 0x4000000
---|"manageNicknames" # 0x8000000
---|"manageRoles" # 0x10000000
---|"manageWebhooks" # 0x20000000
---|"manageEmojis" # 0x40000000
---|"useSlashCommands" # 0x80000000
---|"requestToSpeak" # 0x100000000
---|"manageEvents" # 0x200000000
---|"manageThreads" # 0x400000000
---|"usePublicThreads" # 0x800000000
---|"usePrivateThreads" # 0x1000000000
---|"useExternalStickers" # 0x2000000000
---|"sendMessagesInThreads" # 0x4000000000
---|"useEmbeddedActivities" # 0x8000000000
---|"moderateMembers" # 0x10000000000
---|"monetizationAnalytics" # 0x20000000000
---|"useSoundboard" # 0x40000000000
---|"createExpressions" # 0x80000000000
---|"createEvents" # 0x100000000000
---|"useExternalSounds" # 0x200000000000
---|"sendVoiceMessages" # 0x400000000000

---@alias discordia.enums.permission_value
---|1 # createInstantInvite
---|2 # kickMembers
---|4 # banMembers
---|8 # administrator
---|16 # manageChannels
---|32 # manageGuild
---|64 # addReactions
---|128 # viewAuditLog
---|256 # prioritySpeaker
---|512 # stream
---|1024 # readMessages
---|2048 # sendMessages
---|4096 # sendTextToSpeech
---|8192 # manageMessages
---|16384 # embedLinks
---|32768 # attachFiles
---|65536 # readMessageHistory
---|131072 # mentionEveryone
---|262144 # useExternalEmojis
---|524288 # viewGuildInsights
---|1048576 # connect
---|2097152 # speak
---|4194304 # muteMembers
---|8388608 # deafenMembers
---|16777216 # moveMembers
---|33554432 # useVoiceActivity
---|67108864 # changeNickname
---|134217728 # manageNicknames
---|268435456 # manageRoles
---|536870912 # manageWebhooks
---|1073741824 # manageEmojis
---|2147483648 # useSlashCommands
---|4294967296 # requestToSpeak
---|8589934592 # manageEvents
---|17179869184 # manageThreads
---|34359738368 # usePublicThreads
---|68719476736 # usePrivateThreads
---|137438953472 # useExternalStickers
---|274877906944 # sendMessagesInThreads
---|549755813888 # useEmbeddedActivities
---|1099511627776 # moderateMembers
---|2199023255552 # monetizationAnalytics
---|4398046511104 # useSoundboard
---|8796093022208 # createExpressions
---|17592186044416 # createEvents
---|35184372088832 # useExternalSounds
---|70368744177664 # sendVoiceMessages

---@class discordia.enums.permission: table
---@overload fun(k: discordia.enums.permission_value): discordia.enums.permission_key
local permission = {
	createInstantInvite = 1,
	kickMembers = 2,
	banMembers = 4,
	administrator = 8,
	manageChannels = 16,
	manageGuild = 32,
	addReactions = 64,
	viewAuditLog = 128,
	prioritySpeaker = 256,
	stream = 512,
	readMessages = 1024,
	sendMessages = 2048,
	sendTextToSpeech = 4096,
	manageMessages = 8192,
	embedLinks = 16384,
	attachFiles = 32768,
	readMessageHistory = 65536,
	mentionEveryone = 131072,
	useExternalEmojis = 262144,
	viewGuildInsights = 524288,
	connect = 1048576,
	speak = 2097152,
	muteMembers = 4194304,
	deafenMembers = 8388608,
	moveMembers = 16777216,
	useVoiceActivity = 33554432,
	changeNickname = 67108864,
	manageNicknames = 134217728,
	manageRoles = 268435456,
	manageWebhooks = 536870912,
	manageEmojis = 1073741824,
	useSlashCommands = 2147483648,
	requestToSpeak = 4294967296,
	manageEvents = 8589934592,
	manageThreads = 17179869184,
	usePublicThreads = 34359738368,
	usePrivateThreads = 68719476736,
	useExternalStickers = 137438953472,
	sendMessagesInThreads = 274877906944,
	useEmbeddedActivities = 549755813888,
	moderateMembers = 1099511627776,
	monetizationAnalytics = 2199023255552,
	useSoundboard = 4398046511104,
	createExpressions = 8796093022208,
	createEvents = 17592186044416,
	useExternalSounds = 35184372088832,
	sendVoiceMessages = 70368744177664,
}

---@alias discordia.enums.premiumTier_key
---|"none" # 0
---|"tier1" # 1
---|"tier2" # 2
---|"tier3" # 3

---@alias discordia.enums.premiumTier_value
---|0 # none
---|1 # tier1
---|2 # tier2
---|3 # tier3

---@class discordia.enums.premiumTier: table
---@overload fun(k: discordia.enums.premiumTier_value): discordia.enums.premiumTier_key
local premiumTier = {
	none = 0,
	tier1 = 1,
	tier2 = 2,
	tier3 = 3,
}

---@alias discordia.enums.relationshipType_key
---|"none" # 0
---|"friend" # 1
---|"blocked" # 2
---|"pendingIncoming" # 3
---|"pendingOutgoing" # 4
---|"implicit" # 5

---@alias discordia.enums.relationshipType_value
---|0 # none
---|1 # friend
---|2 # blocked
---|3 # pendingIncoming
---|4 # pendingOutgoing
---|5 # implicit

---@class discordia.enums.relationshipType: table
---@overload fun(k: discordia.enums.relationshipType_value): discordia.enums.relationshipType_key
local relationshipType = {
	none = 0,
	friend = 1,
	blocked = 2,
	pendingIncoming = 3,
	pendingOutgoing = 4,
	implicit = 5,
}

---@alias discordia.enums.status_key
---|"doNotDisturb" # dnd
---|"idle" # idle
---|"invisible" # invisible
---|"offline" # offline
---|"online" # online

---@alias discordia.enums.status_value
---|"dnd" # doNotDisturb
---|"idle" # idle
---|"invisible" # invisible
---|"offline" # offline
---|"online" # online

---@class discordia.enums.status: table
---@overload fun(k: discordia.enums.status_value): discordia.enums.status_key
local status = {
	doNotDisturb = "dnd",
	idle = "idle",
	invisible = "invisible",
	offline = "offline",
	online = "online",
}

---@alias discordia.enums.timestampStyle_key
---|"longDate" # D
---|"longDateTime" # F
---|"relativeTime" # R
---|"longTime" # T
---|"shortDate" # d
---|"shortDateTime" # f
---|"shortTime" # t

---@alias discordia.enums.timestampStyle_value
---|"D" # longDate
---|"F" # longDateTime
---|"R" # relativeTime
---|"T" # longTime
---|"d" # shortDate
---|"f" # shortDateTime
---|"t" # shortTime

---@class discordia.enums.timestampStyle: table
---@overload fun(k: discordia.enums.timestampStyle_value): discordia.enums.timestampStyle_key
local timestampStyle = {
	longDate = "D",
	longDateTime = "F",
	relativeTime = "R",
	longTime = "T",
	shortDate = "d",
	shortDateTime = "f",
	shortTime = "t",
}

---@alias discordia.enums.verificationLevel_key
---|"none" # 0
---|"low" # 1
---|"medium" # 2
---|"high" # 3
---|"veryHigh" # 4

---@alias discordia.enums.verificationLevel_value
---|0 # none
---|1 # low
---|2 # medium
---|3 # high
---|4 # veryHigh

---@class discordia.enums.verificationLevel: table
---@overload fun(k: discordia.enums.verificationLevel_value): discordia.enums.verificationLevel_key
local verificationLevel = {
	none = 0,
	low = 1,
	medium = 2,
	high = 3,
	veryHigh = 4,
}

---@alias discordia.enums.webhookType_key
---|"incoming" # 1
---|"channelFollower" # 2
---|"application" # 3

---@alias discordia.enums.webhookType_value
---|1 # incoming
---|2 # channelFollower
---|3 # application

---@class discordia.enums.webhookType: table
---@overload fun(k: discordia.enums.webhookType_value): discordia.enums.webhookType_key
local webhookType = {
	incoming = 1,
	channelFollower = 2,
	application = 3,
}

---
---The Discord API uses numbers to represent certain data types. For convenience, these are enumerated in Discord as special read-only tables, found in the main Discordia module. All available enumerations are listed at the end of this page.
---
---Users are highly encouraged to use values in this page for a better code quality.
---
---```lua
---local discordia = require("discordia")
---local enums = discordia.enums
---```
---
---Enumerations (enums) can be accessed like a regular Lua table, but they cannot be modified. This is completely optional, but it is generally easier to use and read enumerations than it is to use and read plain numbers. For example, given a text channel object, the following are logically equivalent:
---
---```lua
---if channel.type == 0 then
---    print("This is a text channel")
---end
---
---if channel.type == enums.channelType.text then
---    print("This is still a text channel!")
---end
---
---print(enums.verificationLevel.low) -- 1
---```
---
---Additionally, enumerations work in reverse. If you have the number, but you want to recall the human-readable version, simply call the enum; it will return a string if the enumeration is valid.
---
---```lua
---print(enums.channelType(channel.type)) -- "text"
---print(enums.verificationLevel(1)) -- "low"
---```
---
---If necessary, custom enumerations can be written using the `enum` constructor:
---
---```lua
---local fruit = enums.enum({
---    apple = 0,
---    orange = 1,
---    banana = 2,
---    cherry = 3
---})
---
---print(enums.fruit.apple) -- 0
---print(enums.fruit(2)) -- "banana"
---```
---
---@class discordia.enums: table
---@field actionType discordia.enums.actionType
---@field activityType discordia.enums.activityType
---@field channelType discordia.enums.channelType
---@field defaultAvatar discordia.enums.defaultAvatar
---@field explicitContentLevel discordia.enums.explicitContentLevel
---@field gameType discordia.enums.gameType
---@field gatewayIntent discordia.enums.gatewayIntent
---@field logLevel discordia.enums.logLevel
---@field messageFlag discordia.enums.messageFlag
---@field messageType discordia.enums.messageType
---@field notificationSetting discordia.enums.notificationSetting
---@field permission discordia.enums.permission
---@field premiumTier discordia.enums.premiumTier
---@field relationshipType discordia.enums.relationshipType
---@field status discordia.enums.status
---@field timestampStyle discordia.enums.timestampStyle
---@field verificationLevel discordia.enums.verificationLevel
---@field webhookType discordia.enums.webhookType
local enums = {}

---@class discordia.enums.enum<K, V>: {[K]: V}
---@overload fun(k: any): any

---
---Create a custom enumerator.
---
---@generic K, V
---@param v {[K]: V}
---@return discordia.enums.enum<`K`, `V`>
---@nodiscard
function enums.enum(v) end
