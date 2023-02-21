---@meta

---
---@alias luvit.dns.querytype
---| 1 # dns.TYPE_A
---| 2 # dns.TYPE_NS
---| 5 # dns.TYPE_CNAME
---| 12 # dns.TYPE_PTR
---| 15 # dns.TYPE_MX
---| 16 # dns.TYPE_TXT
---| 28 # dns.TYPE_AAAA
---| 33 # dns.TYPE_SRV

---
---@alias luvit.dns.dnsclass 
---| 1 # dns.TYPE_CLASS_IN

---Node-style dns module for luvit
local dns = {
	TYPE_A = 1, ---@type luvit.dns.querytype
	TYPE_NS = 2, ---@type luvit.dns.querytype
	TYPE_CNAME = 5, ---@type luvit.dns.querytype
	TYPE_PTR = 12, ---@type luvit.dns.querytype
	TYPE_MX = 15, ---@type luvit.dns.querytype
	TYPE_TXT = 16, ---@type luvit.dns.querytype
	TYPE_AAAA = 28, ---@type luvit.dns.querytype
	TYPE_SRV = 33, ---@type luvit.dns.querytype

	CLASS_IN = 1, ---@type luvit.dns.dnsclass
}

---
---@class luvit.dns.ServerAddress
---@field port integer
---@field host string
---@field tcp boolean

---
---@class luvit.dns.BaseQueryAnswer
---@field name string
---@field type luvit.dns.querytype
---@field class integer
---@field ttl integer

---
---@class luvit.dns.AddressQueryAnswer: luvit.dns.BaseQueryAnswer
---@field type 1 | 28
---@field address string

---
---@class luvit.dns.NameServerQueryAnswer: luvit.dns.BaseQueryAnswer
---@field type 2
---@field nsdname string

---
---@class luvit.dns.CanonicalNameQueryAnswer: luvit.dns.BaseQueryAnswer
---@field type 5
---@field cname string

---
---@class luvit.dns.PointerQueryAnswer: luvit.dns.BaseQueryAnswer
---@field type 12
---@field ptrdname string

---
---@class luvit.dns.MailExchangeQueryAnswer: luvit.dns.BaseQueryAnswer
---@field type 15
---@field preference integer
---@field exchange string

---
---@class luvit.dns.TextQueryAnswer: luvit.dns.BaseQueryAnswer
---@field type 16
---@field txt string

---
---@class luvit.dns.ServerQueryAnswer: luvit.dns.BaseQueryAnswer
---@field type 33
---@field priority integer
---@field weight integer
---@field port integer
---@field target string

---
---@class luvit.dns.RawQueryAnswer: luvit.dns.BaseQueryAnswer
---@field type integer
---@field rdata string

---
---@param servers luvit.dns.ServerAddress[]
---@param name string
---@param dnsclass luvit.dns.dnsclass
---@param qtype 1 | 28
---@param callback fun(err?: luvit.core.Error, answers?: luvit.dns.AddressQueryAnswer[])|thread
---@overload fun(servers: luvit.dns.ServerAddress[], name: string, dnsclass: luvit.dns.dnsclass, qtype: 2, callback: fun(err?: luvit.core.Error, answers?: luvit.dns.NameServerQueryAnswer)|thread)
---@overload fun(servers: luvit.dns.ServerAddress[], name: string, dnsclass: luvit.dns.dnsclass, qtype: 5, callback: fun(err?: luvit.core.Error, answers?: luvit.dns.CanonicalNameQueryAnswer)|thread)
---@overload fun(servers: luvit.dns.ServerAddress[], name: string, dnsclass: luvit.dns.dnsclass, qtype: 12, callback: fun(err?: luvit.core.Error, answers?: luvit.dns.PointerQueryAnswer)|thread)
---@overload fun(servers: luvit.dns.ServerAddress[], name: string, dnsclass: luvit.dns.dnsclass, qtype: 15, callback: fun(err?: luvit.core.Error, answers?: luvit.dns.MailExchangeQueryAnswer)|thread)
---@overload fun(servers: luvit.dns.ServerAddress[], name: string, dnsclass: luvit.dns.dnsclass, qtype: 16, callback: fun(err?: luvit.core.Error, answers?: luvit.dns.TextQueryAnswer)|thread)
---@overload fun(servers: luvit.dns.ServerAddress[], name: string, dnsclass: luvit.dns.dnsclass, qtype: 33, callback: fun(err?: luvit.core.Error, answers?: luvit.dns.ServerQueryAnswer)|thread)
function dns.query(servers, name, dnsclass, qtype, callback) end

---
---@param name string
---@param callback fun(err?: luvit.core.Error, answers?: luvit.dns.AddressQueryAnswer[])|thread
function dns.resolve4(name, callback) end

---
---@param name string
---@param callback fun(err?: luvit.core.Error, answers?: luvit.dns.AddressQueryAnswer[])|thread
function dns.resolve6(name, callback) end

---
---@param name string
---@param callback fun(err?: luvit.core.Error, answers?: luvit.dns.ServerQueryAnswer[])|thread
function dns.resolveSrv(name, callback) end

---
---@param name string
---@param callback fun(err?: luvit.core.Error, answers?: luvit.dns.MailExchangeQueryAnswer[])|thread
function dns.resolveMx(name, callback) end

---
---@param name string
---@param callback fun(err?: luvit.core.Error, answers?: luvit.dns.NameServerQueryAnswer[])|thread
function dns.resolveNs(name, callback) end

---
---@param name string
---@param callback fun(err?: luvit.core.Error, answers?: luvit.dns.CanonicalNameQueryAnswer[])|thread
function dns.resolveCname(name, callback) end

---
---@param name string
---@param callback fun(err?: luvit.core.Error, answers?: luvit.dns.TextQueryAnswer[])|thread
function dns.resolveTxt(name, callback) end

---
---@param servers luvit.dns.ServerAddress[]
function dns.setServers(servers) end

---
---@param timeout number
function dns.setTimeout(timeout) end

---
---Sets the timeout to the default timeout of 2 seconds
---
function dns.setDefaultTimeout() end

---
---Sets the list of servers to the default list
---
---```lua
---{
---  {
---    ['host'] = '8.8.8.8',
---    ['port'] = 53,
---    ['tcp'] = false
---  },
---  {
---    ['host'] = '8.8.4.4',
---    ['port'] = 53,
---    ['tcp'] = false
---  },
---}
---```
---
function dns.setDefaultServers() end

---
---@param options? any -- unused
---@return luvit.dns.ServerAddress[] servers
---@nodiscard
function dns.loadResolverWin(options) end

---
---@param options? { file: string }
---@return luvit.dns.ServerAddress[] servers
---@nodiscard
function dns.loadResolverUnix(options) end

---
---@param options? { file: string }
---@return luvit.dns.ServerAddress[] servers
---@nodiscard
function dns.loadResolver(options) end

return dns
