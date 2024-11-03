
return function(_, builder)
  builder:inittype('discordia.client_options')

  builder:paramtype{
    {'run', 2, '{status?: discordia.enums.status_value, afk?: boolean, since?: integer, activities?: {name: string, type: discordia.enums.activityType_value, url?: string, state?: string}[], activity?: {name: string, type: discordia.enums.activityType_value, url?: string, state?: string}}'},
    {'setActivity', 1, 'string|{name?: string, type?: discordia.enums.activityType_value, url?: string}'},
    {'setIntents', 1, 'number'},
    {'enableIntents', 1, 'Intents-Resolvable'},
    {'disableIntents', 1, 'Intents-Resolvable'},
  }

  builder:returntype{
    {'getChannel', 'ChannelUnion'},
    {'listVoiceRegions', '{id: string, name: string, optimal: boolean, deprecated: boolean, custom: boolean}[]'},
    {'getConnections', '{id: string, name: string, type: "amazon-music"|"battlenet"|"bungie"|"domain"|"ebay"|"epicgames"|"facebook"|"github"|"instagram"|"leagueoflegends"|"paypal"|"playstation"|"reddit"|"riotgames"|"roblox"|"spotify"|"skype"|"steam"|"tiktok"|"twitch"|"twitter"|"xbox"|"youtube", revoked?: boolean, integrations?: {id: string, name: string, type: string, enabled: boolean, syncing?: boolean, role_id?: string, enable_emoticons?: boolean, expire_behavior?: 0|1, expire_grace_period?: integer, user?: table, account: {id: string, name: string}, synced_at?: string, subscriber_count?: integer, revoked?: boolean, application?: {id: string, name: string, icon?: string, description: string, bot?: table}, scopes?: string[]}[], verified: boolean, friend_sync: boolean, show_activity: boolean, two_way_link: boolean, visibility: integer}'},
    {'getApplicationInformation', '{id: string, name: string, icon?: string, description: string, rpc_origins?: string[], bot_public: boolean, bot_require_code_grant: boolean, bot?: table, terms_of_service_url?: string, privacy_policy_url?: string, owner?: table, verify_key: string, team?: {icon: string, id: string, members: table, name: string, owner_user_id: string}, guild_id?: string, guild?: table, primary_sku_id?: string, slug?: string, cover_image?: string, flags?: integer, approximate_guild_count?: integer, approximate_user_install_count?: integer, redirect_uris?: string[], interactions_endpoint_url?: string, role_connections_verification_url?: string, event_webhooks_url?: string, event_webhooks_status: 1|2|3, event_webhooks_types?: string[], tags?: string[], install_params?: {scopes: string[], permissions: string}, integration_types_config?: {GUILD_INSTALL?: {oauth2_install_params?: {scopes: string[], permissions: string}}, USER_INSTALL?: {oauth2_install_params?: {scopes: string[], permissions: string}}}, custom_install_url?: string}'},
  }

  builder:nodiscard{
    'getIntents',
    'getWebhook',
    'getInvite',
    'getUser',
    'getGuild',
    'getChannel',
    'getRole',
    'getEmoji',
    'getSticker',
    'listVoiceRegions',
    'getConnections',
    'getApplicationInformation',
  }

  do
    local setGame = builder:copymethod('setActivity')
    setGame.name = 'setGame'
    setGame.deprecated = true
    builder:newmethod(setGame)
  end
end
