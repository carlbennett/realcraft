# Development Status

| Quick Menu                            |
|---------------------------------------|
| [Main Page](/README.md)               |
| [Features](/docs/features.md)         |
| [Development Status](/docs/status.md) |

## 15:28, 28 August 2012 (MST)
Started to work on the project again. Started from what looks to be a newer project file but lacks all of the features I talked about before. Though this one looks cleaner, so I'm keeping it. I have worked up to protocol 1.3.2 without encryption (it will bypass it for now). I need to get worlds setup. Banning IPs and usernames works. Found out I can use chat colors/styles in the disconnect message, so I made the ban messages use them. I also found out I can use a LF (0x0A) character to create a new line, however a CR (0x0D) alone does not work and I didn't try CRLF (0x0D + 0x0A) together. I also want to note that when I create a new line, the next line needs to be spaced three times (0x20 character) in order to get it center-aligned with the line above it, don't know if that's a normal bug or if it's a bug because I'm using chat colors. I do work today into the next day, but I don't work tomorrow (the next day). I will be putting lots of time into this project this week and the coming weeks.

## 05:07, 28 January 2012 (MST)
The project is on temporary hold until further notice. I am far too busy to be spending time with Realcraft at the moment.

## 16:40, 13 January 2012 (MST)
Added saving/loading worlds.

## 21:40, 7 January 2012 (MST)
MySQL support has been added. More packets. Entities are still a work in progress, though events are fired whenever a player moves/looks. Basic chat commands have been added (/emote, /me, /ping, /world). Multi-world support has been finished, including the option to generate a flat nether world (currently based on the world's dimension id whether to generate netherrack or grass). Users now have an ID given to them from a mysql table, and user ranks are also given to users. The tab window, or better known as the server's ping list, has been implemented with fully functional user colors. More updates will be arriving soon.

## 19:33, 2 January 2012 (MST)
Server has been rewritten with a new packet buffering system. It's now much easier for me to do things with the Minecraft protocol as opposed to before. The reason for the rewrite is because A) it was mostly hard to maintain and B) I lost the source code in a hard drive failure. Right now the rewrite is at the point of where the earlier version was; you can run around but don't swing your arm or click anything, don't even walk or jog.

## 08:40, 30 December 2011 (MST)
Development will begin again soon.

## 22:27, 24 October 2011 (MST)
Notchian clients no longer crash. Lots of internal code has been reworked with the help of Ribose. Fixed spawning bugs, it now works correctly on the first time. Fixed gltches with walking/jumping/arm-throwing; you are now free to walk around, just don't hit any blocks (left or right click) at the moment ;). Entities were worked on a bit, and understood a bit more; players should now see other players (but they cannot move right now, they can arm swing though!). Chat is now working properly, and is logged under a different log file. Other than all of this, the server is fairly stable, I can't crash it as of this moment, but that's not to say it isn't crashable, I'm sure somewhere there's a problem.

## 02:38, 24 October 2011 (MST)
Got chunks to load correctly. Need to test if entities can be seen, or if entity animation is sent to other notchian clients. Currently a player is spawned at y=2, but it should be y=67, I need to look into how to fix this.

_Note: This page is licensed under the [CC BY-SA 3.0 Unported](/docs/LICENSE.txt) license, as it is derived from an article on wiki.vg._
