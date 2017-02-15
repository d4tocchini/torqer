torqer
======

*torqer* ready-to-use Tor proxy Docker container, with privoxy on top.

This was inspired by [rdsubhas' tor-proxy-alpine](https://github.com/rdsubhas/docker-tor-privoxy-alpine) container, but actually protects your privacy by exposing Tor's DNS port for DNS resolution and allowing you to adjust its [configuration](torqer/tor/torrc).

# Services

## SOCKS

You can connect directly through Tor by using port 9050 in your SOCKS configuration.

## PRIVOXY

You can connect through [Privoxy](https://www.privoxy.org) to Tor by using port 8118 in your web proxy configuration. Also use DNS resolution through the Docker instance when you use Privoxy!

## DNS

You *should* use Tor for DNS resolution. Therefor this container exposes port 53, so you can simply set it as your primary & secondary DNS, e.g. in your `/etc/resolv.conf`.

# Usage

First, adjust the configurations `torqer/tor/torrc` and `torqer/privoxy/config` to your needs. Afterwards, build the container and run it:

```bash
$ docker build -t=torqer .
$ docker run -it --name torqer torqer
$ su -
# echo "nameserver 192.168.100.1" > /etc/resolv.conf
```

`192.168.100.1` is the IP of the docker host this container runs on. Afterwards simply set up either SOCKS or HTTP proxy in your browser.

# Suggestions

## Browser

- User-Agent randomizer, e.g. [random-user-agent](https://github.com/tarampampam/random-user-agent)
- Anti-tracking extension, e.g. [Ghostery](https://www.ghostery.com)
- Use incognito mode, as it limits/disables access to e.g. LocalStorage

## Paid VPN

- Don't.

# LICENSE

MIT, see [LICENSE](LICENSE)
