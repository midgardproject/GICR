GObject Content Repository
==========================

GICR provides a standard set of content repository interfaces for GObjects. It is based on the Java Content Repository specification. [From Wikipedia](http://en.wikipedia.org/wiki/Content_repository_API_for_Java):

> Content Repository API for Java (JCR) is a specification for a Java platform application programming interface (API) to access content repositories in a uniform manner. The content repositories are used in content management systems to keep the content data and also the metadata used in content management systems (CMS) such as versioning metadata.

By using GICR APIs, a GObject-based application can use the standard interfaces for nodes, tree management, versioning and structured queries regardless of how the data is actually stored.

Any GICR repository implementation should be accessible from any environment that can do [GObject Introspection](https://live.gnome.org/GObjectIntrospection), including JavaScript, Python and Ruby.

## Why GICR?

Having a standard content repository allows GNOME applications to move from individual file formats or custom databases to managing data in interoperable ways.

The interfaces also allow easy merging of data coming from both local and remote sources, allowing users to switch easily between mobile devices, the cloud and the desktop.

GICR allows moving from _saving_ to _versioning_, providing a much safer way for users to manage their information, whether dealing with office documents or contact details.

We feel that GICR would provide an especially good base for concepts like the [GNOME Documents](https://live.gnome.org/Design/Apps/Documents) application.

## Status

At this point GICR is in a proposal state and is being developed by the Midgard team. We hope that other GNOME projects will also participate in this effort. For example, having a combined file system and Tracker implementation would be very useful.

Midgard2 is being adapted to these interfaces as the work progresses.

## Related projects

Other Content Repository interfaces:

* [JSR-283](http://jcp.org/en/jsr/detail?id=283), Content Repository interfaces for Java
* [NoCR](http://github.com/nocr/nocr), Content Repository interfaces for Node.js
* [PHPCR](http://phpcr.github.com/), Content Repository interfaces for PHP

Related projects from the GNOME space, all of which could be providers or consumers of GICR:

* [DesktopCouch](http://www.freedesktop.org/wiki/Specifications/desktopcouch)
* [evolution-data-server](http://www.go-evolution.org/EDS_Architecture)
* [libGDA](http://www.gnome-db.org/)
* [LibGData](https://live.gnome.org/libgdata)
* [Midgard2](http://new.midgard-project.org/midgard2)
* [Tracker](http://projects.gnome.org/tracker/)
* [Zeitgeist](https://live.gnome.org/Zeitgeist)

## Developers

* Henri Bergius
* Piotr Pokora
