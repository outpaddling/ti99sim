# ti99sim

This is a fork of ti99sim0.16.0 from 
[https://mrousseau.org/programs/ti99sim/](https://mrousseau.org/programs/ti99sim/).

Many thanks for Mark Rousseau for the monumental effort of creating this
awesome simulator!  This emulator is well-written, with highly portable
code written in a mainstream compiled language.

This fork was created for the following purposes:

1.  Share patches I've created in order to fix build issues, modernize the
    code, and port to other Unix variants.  See the commits for changes
    and rationale.

2.  Invite input from others interested in contributing to ti99sim.

3.  To provide a forum for discussions specific to ti99sim.

I maintain a FreeBSD port (see my personal work-in-progress collection
at [https://github.com/outpaddling/freebsd-ports-wip](https://github.com/outpaddling/freebsd-ports-wip)
for the latest, and a [pkgsrc](https://pkgsrc.org) package (see the
official pkgsrc-wip collection [http://pkgsrc.org/wip/](http://pkgsrc.org/wip/).
The pkgsrc package should work on any Unix-like platform, including BSDs,
most Linux distributions, and macOS.

Note: There are several TI-99/4a ROM files floating around the Internet,
but the only one I found that works is the one downloaded by the
provided setup / ti99-setup scripts from ftp.whtech.com.
