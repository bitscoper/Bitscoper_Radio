<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output omit-xml-declaration="no" method="xml"
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"
        encoding="UTF-8" />
    <xsl:template
        match="/icestats">
        <!-- By Abdullah As-Sadeed -->
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta charset="UTF-8" />
                <base href="https://radio.bitscoper.dev/" />
                <meta name="author" content="Abdullah As-Sadeed" />
                <link rel="manifest" href="Web_Manifest.webmanifest" />
                <meta name="theme-color" content="rgb(66, 66, 66)" />
                <link rel="icon" type="image/x-icon" href="favicon.ico" />
                <link rel="apple-touch-icon" href="Assets/Images/Logo_192x192.png" />
                <title>Bitscoper Radio</title>
                <meta name="description" content="Bitscoper Radio" />
                <meta name="keywords" content="stream, radio, video, audio, broadcast" />
                <link rel="stylesheet" type="text/css" href="Stylesheet.css" />
                <meta name="viewport"
                    content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
            </head>
            <body lang="en-US">
                <h1 id="header">Bitscoper Radio</h1>
                <xsl:for-each select="source">
                    <xsl:choose>
                        <xsl:when test="listeners">
                            <div class="mounts">
                                <h3> Mount Point: <xsl:value-of select="@mount" />
                                </h3>
                                <xsl:if
                                    test="server_type and ((server_type = 'application/ogg') or (server_type = 'audio/ogg') or (server_type = 'application/mpeg') or (server_type = 'audio/mpeg'))">
                                    <audio controls="controls" preload="none">
                                        <source src="{@mount}" type="{server_type}" /> Your browser
        does not support HTML5 audio. </audio>
                                </xsl:if>
                                <xsl:if
                                    test="server_type and ((server_type = 'application/webm') or (server_type = 'video/webm'))">
                                    <video controls="controls" preload="none">
                                        <source src="{@mount}" type="{server_type}" /> Your browser
        does not support HTML5 video. </video>
                                </xsl:if>
                                <table class="mount_info_table">
                                    <tbody>
                                        <xsl:if test="server_name">
                                            <tr>
                                                <td>Stream Name</td>
                                                <td>
                                                    <b>: </b>
                                                    <xsl:value-of select="server_name" />
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="title">
                                            <tr>
                                                <td>Title</td>
                                                <td>
                                                    <b>: </b>
                                                    <xsl:value-of select="title" />
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="artist">
                                            <tr>
                                                <td>Artist</td>
                                                <td>
                                                    <b>: </b>
                                                    <xsl:value-of select="artist" />
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="genre">
                                            <tr>
                                                <td>Genre</td>
                                                <td>
                                                    <b>: </b>
                                                    <xsl:value-of select="genre" />
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="server_type">
                                            <tr>
                                                <td>Content Type</td>
                                                <td>
                                                    <b>: </b>
                                                    <xsl:value-of select="server_type" />
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="bitrate">
                                            <tr>
                                                <td>Bitrate</td>
                                                <td>
                                                    <b>: </b>
                                                    <xsl:value-of select="bitrate" />
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="quality">
                                            <tr>
                                                <td>Quality</td>
                                                <td>
                                                    <b>: </b>
                                                    <xsl:value-of select="quality" />
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="frame_size">
                                            <tr>
                                                <td>Framesize</td>
                                                <td>
                                                    <b>: </b>
                                                    <xsl:value-of select="frame_size" />
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="frame_rate">
                                            <tr>
                                                <td>Framerate</td>
                                                <td>
                                                    <b>: </b>
                                                    <xsl:value-of select="frame_rate" />
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="video_quality">
                                            <tr>
                                                <td>Video Quality</td>
                                                <td>
                                                    <b>: </b>
                                                    <xsl:value-of select="video_quality" />
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="stream_start">
                                            <tr>
                                                <td>Stream started</td>
                                                <td>
                                                    <b>: </b>
                                                    <xsl:value-of select="stream_start" />
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="listeners">
                                            <tr>
                                                <td>Audiences</td>
                                                <td>
                                                    <b>: </b>
                                                    <xsl:value-of select="listeners" />
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="listener_peak">
                                            <tr>
                                                <td>Peak Audiences</td>
                                                <td>
                                                    <b>: </b>
                                                    <xsl:value-of select="listener_peak" />
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="server_description">
                                            <tr>
                                                <td>Description</td>
                                                <td>
                                                    <b>: </b>
                                                    <xsl:value-of select="server_description" />
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="server_url">
                                            <tr>
                                                <td>Stream URL</td>
                                                <td>
                                                    <a href="{server_url}"> : <xsl:value-of
                                                            select="server_url" />
                                                    </a>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                    </tbody>
                                </table>
                                <xsl:choose>
                                    <xsl:when test="authenticator">
                                        <a class="auth" href="/auth.xsl">Login</a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <div class="link_list">
                                            <span>
                                                <a href="{@mount}" target="new" title="Direct Link">
        Direct</a>
                                            </span>
                                            <span>
                                                <a href="{@mount}.m3u" target="new"
                                                    title="M3U Playlist">M3U</a>
                                            </span>
                                            <span>
                                                <a href="{@mount}.xspf" target="new"
                                                    title="XSPF Playlist">XSPF</a>
                                            </span>
                                            <span>
                                                <a href="{@mount}.vclt" target="new"
                                                    title="VCLT Playlist">VCLT</a>
                                            </span>
                                        </div>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </div>
                        </xsl:when>
                        <xsl:otherwise>
                            <h3> : <xsl:value-of select="@mount" /> - Not Connected </h3>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <div id="footer"><a href="https://github.com/bitscoper/Bitscoper_Radio/"
                        title="Source Code" target="new">Source Code</a> | © <a
                        href="https://bitscoper.dev/"
                        title="Abdullah As-Sadeed" target="new">Abdullah As-Sadeed</a>
                </div>
                <script src="Script.js"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>