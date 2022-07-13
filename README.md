# Luvit-Meta

This project is a collection of meta definitions for the platform [Luvit](https://github.com/Luvit/Luvit). The meta definitions provide typing for returns, parameters, constants and classes; It does as well provide documentation comments where possible, either by scraping the Luvit-docs, Nodejs docs, luv docs or manually written in some places.

Some of those definitions are scraped off of code/docs and then some manual work is done to figure types out. For those the used scraper is located under [scrapers](/scrapers), the scraper outputs to a file in the same directory. From there the output is manually copied over to the actual library definition.
Other defintions -and most of them- are completely manually written, I have not written a scraper for those mostly because the automated part is really not worth it. That is, the automated part would be a single copy-paste operation then delete anything between `function x()` and `end`. Something I prefer doing manually so I can actually catch some of the weird stuff.

### How does it work?

Here are some samples of it working:

https://user-images.githubusercontent.com/38175840/169595790-80305ae3-c4fc-478a-af59-6bfa2acb2635.mp4


https://user-images.githubusercontent.com/38175840/169615756-f9946531-d943-4942-9124-f819783bc180.mp4


https://user-images.githubusercontent.com/38175840/169663522-5aed02c1-1308-49d6-8d63-3de23a872ef7.mp4


### Where to expect it to working?

Those metafiles where specifically generated to work with [Sumneko's Lua Language Server](https://github.com/sumneko/lua-language-server/), although it *may* work with other EmmyLua supported Language Servers. While the latter is not a goal of this project, minimum care was taken while writing the definitions.

### How to install it?

To install this into your language server, all you have to do is clone the git tree into the extension meta folder. In case of Sumneko's Language Server on VSCode, this will be `vscode/extensions/sumneko.lua-x-y-z/server/meta/3rd/Luvit`, where x-y-z is the extension version you have.

The exact path of VSCode's extension folder will depend on your system and how you installed VSCode, usually speaking although:
  - On Windows: `%USERPROFILE%\.vscode\extensions`.
  - On MacOS: `~/.vscode/extensions`.
  - On Linux: `~/.vscode/extensions`.
Again, it highly depends on how you installed VSCode and how you configure it. So figure this bit out.


Here is how to install this step by step on VSCode, Sumneko's Language Server:

1. Open your terminal of choice up.
2. Execute `cd {PATH}`; where `{PATH}` is replaced with the `vscode/extensions/sumneko.lua-x-y-z/server/meta/3rd/` directory (the exact path will depend on your system, see above).
3. Execute the following command: `git clone https://github.com/Bilal2453/luvit-sumneko-meta.git ./Luvit`.
4. You shall now see a new folder called `Luvit`, inside of it you shall see a `library` folder. This means the installation is done.

### How to use it?

It should automatically detect when you are using Luvit, and prompt you for using its definitions with something similar to the following:

![image](https://user-images.githubusercontent.com/38175840/169589684-c5770fc0-7026-4d13-b957-f776966b676d.png)

Once it prompts you this, choose "Apply and modify settings". You should now see a new `.vscode` folder in your main workspace directory, and modules such as `http` have their fields show in completion tab. If you don't see this, make sure you have opened your project as VSCode Workspace.

If it does not prompt you automatically, you can manually trigger it by typing `-- use-luvit` in a Lua file inside your VSCode workspace somewhere, save the file, then reload your workspace. It should now prompt you with something similar to the previous picture. Once you apply the settings, you can remove the `-- use-luvit`.

### Advanced configurations

When you click on "Apply and modify settings" the extension would create a `.vscode` folder in your current directory (if you didn't already have one) which contains a `settings.json` file.  That file is where all the workspace settings goes into.

By default that file looks something like this:

```json
{
  "Lua.runtime.path": [
    "?.lua",
    "?/init.lua",
    "deps/?/init.lua",
    "deps/?.lua",
    "libs/?.lua",
    "libs/?/init.lua"
  ],
  "Lua.workspace.library": [
    "${3rd}/Luvit/library",
    "../deps",
    "../libs"
  ],
  "Lua.runtime.builtin": {
    "basic": "disable",
    "package": "disable",
    "string": "disable",
    "table": "disable"
  },
  "Lua.diagnostics.globals": [
    "p",
    "args"
  ],
  "Lua.workspace.checkThirdParty": false
}
```

If and for whatever reason "Apply and modify settings" does not work properly, you can create this manually and it should start working.  You can as well do a bit more advanced configurations here (also available from the extension settings GUI on VSCode).

To explain what and why each field exists:

  - `Lua.runtime.path`: We define this to make sure Sumneko's LSP can resolve modules in Luvit's special `deps`/`libs` folders. It makes things such as `require('discordia')` actually resolve to the module file.
  - `Lua.workspace.library`: Those are the directories that contain meta definitions. `${3rd}/Luvit/library` is where this meta library should be installed at. `../deps` and `../libs` is a hopeless try from me to somewhat support the recursive `require` Luvit can have.
  - `Lua.runtime.builtin`: This makes sure to disable the built-in meta files we are overriding. This prevents duplicates entries for stuff like `getfenv`.
  - `Lua.diagnostics.globals`: At first I used this to imply globals. But this should be totally safe to remove. It is unneeded and I may remove it in the future.
  - `Lua.workspace.checkThirdParty`: This stop any further 3rd libraries checking, to make sure it does not keep annoying you with the prompt.

### What modules have definitions?

- [ ] buffer
- [ ] childprocess
- [x] codec
- [x] core
- [x] dgram
- [ ] dns
- [x] env
- [x] fs
- [x] helpful
- [x] hooks
- [x] http
- [x] http-codec
- [x] http-header
- [x] https
- [x] json
- [x] los
- [x] lpeg
- [x] net
- [x] path
- [x] pathjoin
- [x] pretty-print
- [x] process
- [x] querystring
- [x] re
- [ ] readline
- [ ] repl
- [x] require
- [ ] resources
- [x] stream
- [ ] thread
- [x] timer
- [x] tls
- [x] url
- [x] ustring
- [x] utils
- [x] uv

### Why basic, table and string built-ins have been overwritten?

Since [Luvi](https://github.com/Luvit/Luvi)/[Luvit](https://github.com/Luvit/Luvit) come with Lua 5.2 compat (and even some Lua 5.3 stuff), the Language Server thinks they are not defined for the JIT environment giving away many annoying warnings. Thus I had to manually overwrite the built-in definitions and include the `JIT` version.

There is also [the difference between LuaJIT and Luvi](https://github.com/Luvit/Luvi#integration-with-cs-main-function) when it comes to `args` vs `arg`. The only way for me to tell the Language Server "hey, there is nothing such as `args`" is by overwriting the built-in definition.

### My Luvit/library suddenly dissappeared!

Sadly, when you update the extension a new folder for the new extension version is created and the old one is deleted.  So whenever you update the extension this will break and you iwll have to reinstall it.

One possible solution is to install the luvit-meta in a different folder, and point the LSP to it by setting `Lua.workspace.library`. Note that if you do this there may be other configurations to set.

## License

This exhausting project is licensed under Apache License 2.0, see [LICENSE](/LICENSE) for more information. Feel free to fork and/or PR changes.
