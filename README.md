# Itamae-Kuroko2

## Description

Automated installation of [Kuroko2](https://github.com/cookpad/kuroko2) by using [itamae](https://github.com/itamae-kitchen/itamae).

## How to use

```bash
$ itamae ssh cookbooks/kuroko2/default.rb
```

You should set your own Google OAuth variables to `/opt/kuroko2/.env` after execution of the itamae script.

Then you can start a Kuroko2 service.

```bash
$ cd /opt/kuroko2
$ sudo foreman start
```

