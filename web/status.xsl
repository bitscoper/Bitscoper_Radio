<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output omit-xml-declaration="no" method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:template
        match="/icestats">
        <!-- By Abdullah As-Sadeed -->
        <html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
            <head>
                <meta charset="UTF-8"/>
                <base href="https://radio.bitscoper.dev/"/>
                <title>Bitscoper Radio</title>
                <link rel="icon" type="image/x-icon" href="/favicon.ico"/>
                <meta name="theme-color" content="#1e1e2e"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes"/>
                <meta name="color-scheme" content="dark"/>
                <link rel="stylesheet" type="text/css" href="/Stylesheet.css"/>
                <meta name="mobile-web-app-capable" content="yes"/>
                <link rel="manifest" href="/Application.webmanifest"/>
                <meta name="apple-mobile-web-app-title" content="Bitscoper Radio"/>
                <link rel="apple-touch-icon" href="/Icons/Transparent/192x192.png" type="image/png"/>
                <meta name="robots" content="index, follow"/>
                <meta name="author" content="Abdullah As-Sadeed"/>
                <meta name="description" content="An XSLT-Driven PWA UI for Icecast Servers"/>
                <link rel="me" href="https://github.com/bitscoper/Bitscoper_Radio/"/>
                <meta name="google-site-verification" content="nPqxZsjTdkgkE2-u1AvvvuMZWIk_qJWno_eTHkJAUL0"/>
            </head>
            <body lang="en-US">
                <header>
                    <h1>Bitscoper Radio</h1>
                </header>
                <xsl:for-each select="source">
                    <xsl:choose>
                        <xsl:when test="listeners">
                            <section>
                                <h2>
                                    Mount Point:
                                    <xsl:value-of select="@mount"/>
                                </h2>
                                <xsl:if test="server_type and ((server_type = 'application/ogg') or (server_type = 'audio/ogg') or (server_type = 'application/mpeg') or (server_type = 'audio/mpeg'))">
                                    <audio controls="controls" preload="none">
                                        <source src="{@mount}" type="{server_type}"/>
                                        Your browser
                                                does not support HTML5 audio.
                                    </audio>
                                    <canvas></canvas>
                                </xsl:if>
                                <xsl:if test="server_type and ((server_type = 'application/webm') or (server_type = 'video/webm'))">
                                    <video controls="controls" preload="none">
                                        <source src="{@mount}" type="{server_type}"/>
                                        Your browser
                                                does not support HTML5 video.
                                    </video>
                                </xsl:if>
                                <table>
                                    <tbody>
                                        <xsl:if test="server_name">
                                            <tr>
                                                <th>Stream Name</th>
                                                <td>
                                                    <xsl:value-of select="server_name"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="title">
                                            <tr>
                                                <th>Content Title</th>
                                                <td>
                                                    <xsl:value-of select="title"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="artist">
                                            <tr>
                                                <th>Artist</th>
                                                <td>
                                                    <xsl:value-of select="artist"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="genre">
                                            <tr>
                                                <th>Genre</th>
                                                <td>
                                                    <xsl:value-of select="genre"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="server_type">
                                            <tr>
                                                <th>Content Type</th>
                                                <td>
                                                    <xsl:value-of select="server_type"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="bitrate">
                                            <tr>
                                                <th>Bit Rate</th>
                                                <td>
                                                    <xsl:value-of select="bitrate"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="quality">
                                            <tr>
                                                <th>Quality</th>
                                                <td>
                                                    <xsl:value-of select="quality"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="frame_size">
                                            <tr>
                                                <th>Frame Size</th>
                                                <td>
                                                    <xsl:value-of select="frame_size"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="frame_rate">
                                            <tr>
                                                <th>Frame Rate</th>
                                                <td>
                                                    <xsl:value-of select="frame_rate"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="video_quality">
                                            <tr>
                                                <th>Video Quality</th>
                                                <td>
                                                    <xsl:value-of select="video_quality"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="stream_start">
                                            <tr>
                                                <th>Stream Started</th>
                                                <td>
                                                    <xsl:value-of select="stream_start"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="listeners">
                                            <tr>
                                                <th>Audiences</th>
                                                <td>
                                                    <xsl:value-of select="listeners"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="listener_peak">
                                            <tr>
                                                <th>Peak Audiences</th>
                                                <td>
                                                    <xsl:value-of select="listener_peak"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="server_description">
                                            <tr>
                                                <th>Description</th>
                                                <td>
                                                    <xsl:value-of select="server_description"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="server_url">
                                            <tr>
                                                <th>Stream URL</th>
                                                <td>
                                                    <a href="{server_url}">
                                                        <xsl:value-of select="server_url"/>
                                                    </a>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                    </tbody>
                                </table>
                                <xsl:choose>
                                    <xsl:when test="authenticator">
                                        <a href="/auth.xsl">Login</a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <div>
                                            <span>
                                                <a href="{@mount}" title="Direct Stream" target="_blank">
                                                    Direct</a>
                                            </span>
                                            <span>
                                                <a href="{@mount}.m3u" title="M3U Playlist" target="_blank">M3U</a>
                                            </span>
                                            <span>
                                                <a href="{@mount}.xspf" title="XSPF Playlist" target="_blank">XSPF</a>
                                            </span>
                                            <span>
                                                <a href="{@mount}.vclt" title="VCLT Playlist" target="_blank">VCLT</a>
                                            </span>
                                        </div>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </section>
                        </xsl:when>
                        <xsl:otherwise>
                            <h2>
                                :
                                <xsl:value-of select="@mount"/>
                                - Not Connected
                            </h2>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <footer>
                    <a href="https://github.com/bitscoper/Bitscoper_Radio/" title="Source Code" target="_blank">Source Code</a>
                </footer>
                <script src="Script.js"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
