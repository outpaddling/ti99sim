# ti99sim

This is a fork of ti99sim 0.16.0 from 
[https://mrousseau.org/programs/ti99sim/](https://mrousseau.org/programs/ti99sim/).

Many thanks for Mark Rousseau for the monumental effort of creating this
awesome emulator!  This is a quality software package, with highly portable
open source code, written in a mainstream compiled language.  It should
work well on any operating system well into the future with minimal
maintenance required.

## Why the fork?

This fork was created for the following purposes:

1.  Publicize patches I've written in order to fix build issues, modernize the
    code, and port to other Unix variants.  See the commits for changes
    and rationale.

2.  Invite input from others interested in contributing improvements to
    ti99sim.
    See the "Issues" section of this repository on the Github site.

3.  Provide a forum for discussions specific to ti99sim.  See the "Discussions"
    section of this repository on the Github page.

## Important note to new users

There are several TI-99/4A ROM files floating around the Internet,
but the only one I found that works is the one downloaded from ftp.whtech.com
by the setup / ti99-setup scripts included with ti99sim.

## Installing ti99sim

I maintain a FreeBSD port (see my personal work-in-progress collection
at [https://github.com/outpaddling/freebsd-ports-wip](https://github.com/outpaddling/freebsd-ports-wip)
for the latest, and a [pkgsrc](https://pkgsrc.org) package (see the
official pkgsrc-wip collection [http://pkgsrc.org/wip/](http://pkgsrc.org/wip/).
The pkgsrc package should work on any Unix-like platform, including BSDs,
most Linux distributions, and macOS.

To use the FreeBSD WIP port:

```
pkg install auto-admin
auto-ports-wip-checkout
wip-reinstall-port ti99sim
```

To use the pkgsrc-wip package:

If you are not running NetBSD, download auto-pkgsrc-setup from
[https://netbsd.org/~bacon/](https://netbsd.org/~bacon/) to set up pkgsrc
on your system.  Then...

```
sh auto-pkgsrc-setup
```

Be sure to answer yes when asked if you want to install pkgsrc-wip.  After
auto-pkgsrc-setup completes, you should be able to run the following:

```
wip-reinstall-pkg ti99sim
```

I don't run Windows, but Windows users can utilize the FreeBSD port
or pkgsrc package in a Unix virtual machine under VirtualBox or similar
free VMMs.
