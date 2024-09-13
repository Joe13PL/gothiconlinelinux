Configuration
List of available settings that can be set in config.xml configuration file. The config.xml file, it is the main configuration file for your whole server.

server
Represents root element for every configuration file. It is a required element.

Usage:

<server>
    <!-- Configuration elements -->
</server>
config
This element specifies basic settings for server startup. It is a required element and available only in root configuration file.

public: Attribute specifies whether server will be announced to the master server.
host_name: Attribute specifies the name of the server visible in launcher.
max_slots: Attribute specifies the number of maximum player slot available on the server.
port: Attribute specifies the UDP port on which the server will be accepting incoming connections.
Usage:

<server>
    <config public="true" host_name="My server" max_slots="32" port="28970" />
</server>
debug
Available since version: 0.2.1

This element enables/disables debug-mode. While debug-mode is enabled two thing happen:

More debug information are included into squirrel vm stack.
Client allocates console to make debugging script easier on client-side.
Available only in root configuration file.

Usage:

<server>
    <debug>true</debug>
</server>
world
This element specifies startup map that will be loaded right after player joined the server. Available only in root configuration file.

Usage:

<server>
    <world name="NEWWORLD\\NEWWORLD.ZEN" />
</server>
version
This element specifies minimal required client build version to join the server. Available only in root configuration file.

Usage:

<server>
    <version build="0" />
</server>
master
This element specifies master server connection settings. Available only in root configuration file.

Usage:

<server>
    <master host="master.gothic-online.com.pl" port="7777" />
</server>
description
This element specifies the server description visible in launcher. Available only in root configuration file.

Usage:

<server>
    <description>
        <![CDATA[
        <center>
            <b><font color=blue>Gothic</font> 2 <font color=red>Online</font> 0.1.10.0</b><br>
        </center>
        ]]>
    </description>
</server>
data
This element specifies the location of file that contains Gothic npc instances, item instances and model script animation lists.
IT IS A REQUIRED FILE!, without it g2o won't work properly, to generate this file you need to:

enable <debug>true</debug> in config.xml
join your server, while in the game, open up the ingame console (via tilde key)
type generate data
copy the YOUR_GAME_PATH/Multiplayer/data.xml file into server root directory.
add the following line into your config.xml file <data src="data.xml />
Usage:

<server>
    <data src="data.xml" />
</server>
mds
This element specifies the location of file that contains Gothic mds names which will be registered by server. Registered mds are used to generate identifiers for network optimization.

Usage:

<server>
    <mds src="mds.xml" />
</server>
wayfile
This element specifies the location of file that contains waypoints and map for which loaded waypoints will be used.

Usage:

<server>
    <wayfile map="NEWWORLD" src="waypoints/newworld.xml" />
</server>
script
This element specifies script which is loaded when the server/client starts.

src: Attribute specifies the location of file that contains script data.
type: Attribute specifies on which side script is loaded. Available client, server, shared.
Usage:

<server>
    <!-- Will be loaded only on client-side -->
    <script src="client-scripts/main.nut" type="client" />
    <!-- Will be loaded only on server-side -->
    <script src="server-scripts/main.nut" type="server" />
    <!-- Will be loaded on both client-side and server-side -->
    <script src="shared-scripts/main.nut" type="shared" />
</server>
module
This element specifies module which is loaded when the server/client starts. Modules are dynamic-link libraries written in C/C++ to extend possibilities of server.

src: Attribute specifies the location of module.
type: Attribute specifies on which side module is loaded. Available client, server.
(optional) md5: Attribute specifies the md5 hash of the module.
(optional) required: Attribute specifies if the module is required for the server. If the module is optional, you can set it to false.
Usage:

<server>
    <!-- Will be loaded only on client-side -->
    <module src="MyModule.dll" type="client" />
    <!-- Will be loaded only on server-side -->
    <module src="MyModule.so" type="server" />
</server>
import
This element specifies the location of import file which will extend current configuration. Elements which are inside import file are using relative path from directory.

Usage:

<server>
    <import src="gamemodes/prototype/scripts.xml" />
</server>
resource
Available since version: 0.2.0

Remember to delete cache directory after every change in resource configuration!

This element specifies required resource to play on the server. Resources are automatically downloaded and loaded in-game.

vdf: Attribute specifies the location of vdf file.
Usage:

<server>
    <resource vdf="fancy-armors.vdf" />
</server>
downloader
Available since version: 0.2.0

This element specifies downloader settings.

(optional) file-max-chunk: Element specifies the file chunk limit in bytes. Limits the amount of data that can be transferred in a single send file call. Without the limit, large files or one fast connection may seize the worker process entirely. Default value is 4 mb.
(optional) rate-limit: Element specifies the maximum requests that can be received by server from one address per minute. Default value is 30.
(optional) url: Element specifies the external URL from which client will download needed resources. If not specified, clients will download files directly from the server.
(optional) group: Element specifies the name of directory to which needed resources will be downloaded. Default behaviour creates directory in following format ip_port.
Usage:

<server>
    <downloader>
        <file-max-chunk>2097152</file-max-chunk>
        <rate-limit>30</rate-limit>
        <url>http://localhost:8080</url>
        <group>MyServer</group>
    </downloader>
</server>
streamer
Available since version: 0.2.0

This element specifies streamer settings. The streamer is cylindrical (πr^2h) and defines in what area other players are visible in relation to their camera position.

(optional) radius: Element specifies the radius which determines how far others players can be seen from player camera x and z position. Possible range 0-15000 cm.
(optional) height: Element specifies the height which determines how far others players can be seen from player camera y position. Possible range 0-15000 cm.
(optional) intervals.refresh: Element specifies the refresh rate of streamer. Possible range 500-10000 milliseconds.
(optional) intervals.info: Element specifies the broadcast interval for players, that are not currently streamed by specified player. Broadcast message contains minimal data about player like position and angle. By default, this feature is disabled. Possible range 500-60000 milliseconds.
Usage:

<server>
    <streamer>
        <!-- Default values -->
        <radius>3500</radius>
        <height>2000</height>
        <intervals>
            <refresh>500</refresh>
            <info>500</info>
        </intervals>
    </streamer>
</server>
synchronization
Available since version: 0.2.0

This element specifies synchronization settings. Synchronization specifies milliseconds intervals on how often specified type of packet can be sent to server.

(optional) broadcast-zone-distance: Element specifies the broadcast zone distance. To optimize network load, streamed players are placed in broadcast zones, which are dependent on distance (zone 0: <0;1250>). The farther broadcast zone is the fewer data is sent through network.
(optional) intervals.player: Element specifies the interval of packet used to synchronize player movement and some statistics. Possible range 30-1000 milliseconds.
(optional) intervals.camera: Element specifies the interval of packet used to synchronize player camera position. Possible range 30-1000 milliseconds.
(optional) intervals.face-ani: Element specifies the minimum interval of packet used to synchronize player face animation. Possible range 100-1000 milliseconds.
(optional) intervals.wear: Element specifies the minimum interval of packet used to synchronize equipped gear by player. Possible range 100-1000 milliseconds.
Usage:

<server>
    <synchronization>
        <!-- Default values -->
        <broadcast-zone-distance>1250</broadcast-zone-distance>
        <intervals>
            <player>100</player>
            <camera>500</camera>
            <face-ani>300</face-ani>
            <wear>300</wear>
        </intervals>
    </synchronization>
</server>
modification
Available since version: 0.2.1

This element allows you to enable/disable external modifications. Available only in root configuration file.

(optional) ikarus: Element enables/disables ikarus support.
Usage:

<server>
    <modification>
        <ikarus>false</ikarus>
    </modification>
</server>


ALL DOCS: https://gothicmultiplayerteam.gitlab.io/docs/0.3.0/
