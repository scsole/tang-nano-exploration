# Gowin IDE installation

## Download

Go to the official website
[gowinsemi.com.cn/faq.aspx](http://www.gowinsemi.com.cn/faq.aspx) and download
the appoprate package for you system. In my case I downloaded
`Gowin_V1.9.7Beta_linux.tar.gz`

![](./images/ide-installation/software_links.png)

## Installation

### Linux

Extract the downloaded files and execute `gw_ide` inside the `IDE/bin/`
directory.

```
$ tar xvzf Gowin_V1.9.7Beta_linux.tar.gz
...
$ ./IDE/bin/gw_ide
./IDE/bin/gw_ide: symbol lookup error: /lib64/libfontconfig.so.1: undefined symbol: FT_Done_MM_Var
```

Well that clearly didn't work! If a window magically appears on your screen
continue to the next section, otherwise read on. The lookup errors are caused
by outdated libraries shipped with the Gowin software. If we delete or rename
the offending libraries, this problem will be resolved. In my case, the
procedure was as follows.

```
$ mv ./IDE/lib/libfreetype.so.6 ./IDE/lib/libfreetype.so.6.bak
```

Once removed, `gw_ide` should launch successfully and complain that no
licence is configured.

## License

A license can be setup with a 'Local Licence File' or a 'Floating License
Server'. The floating license server is simple to configure but needs a
network connection. Given we've just downloaded the software, I think we can
manage this requirement.

After downloading the software, we are prompted for a license. To activate
using Sipeed's license server use the server address `45.33.107.56` and the
port number `10559`. The 'Test Connection' button should cause a green
'Success' message message to appear. Go ahead and press save.

![](./images/ide-installation/license_configuration.png)

Now set the environment variable `LM_LICENSE_FILE=27020@45.33.107.56` and
relaunch the program. You can add it using your `.bashrc`.

```
$ echo export LM_LICENSE_FILE=27020@45.33.107.56 >> ~/.bashrc
$ . ~/.bashrc
```

Awesome! It's time to get programming.

## References

- [IDE installation - Tang Nano DOC](http://tangnano.sipeed.com/en/get_started/install-the-ide.html)
- [Gowin Source Software User Guide](http://cdn.gowinsemi.com.cn/SUG100-1.8_Gowin%E4%BA%91%E6%BA%90%E8%BD%AF%E4%BB%B6%E7%94%A8%E6%88%B7%E6%8C%87%E5%8D%97.pdf)
