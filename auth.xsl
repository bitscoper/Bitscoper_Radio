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
                <base href="https://bitscoper.live:17101/" />
                <meta name="author" content="Abdullah As-Sadeed" />
                <link rel="manifest" href="Bitscoper_Radio.webmanifest" />
                <meta name="theme-color" content="rgb(66, 66, 66)" />
                <link rel="icon" type="image/x-icon" href="favicon.ico" />
                <link rel="apple-touch-icon" href="Bitscoper_Radio_192.png" />
                <title>Bitscoper Radio</title>
                <meta name="description" content="Bitscoper Radio" />
                <meta name="keywords" content="stream, radio, video, audio, broadcast" />
                <link rel="stylesheet" type="text/css" href="Bitscoper_Radio.css" />
                <meta name="viewport"
                    content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
            </head>
            <body lang="en-US">
                <h1 id="header">Bitscoper Radio</h1>
                <h2>Authorization</h2>
                <xsl:for-each select="source">
                    <xsl:choose>
                        <xsl:when test="listeners">
                            <xsl:if test="authenticator">
                                <div class="mounts">
                                    <h3 class="mount"> Mount Point <xsl:value-of select="@mount" />
                                        <xsl:if
                                            test="server_name">
                                            <small>
                                                <xsl:value-of select="server_name" />
                                            </small>
                                        </xsl:if>
                                    </h3>
                                    <form class="alignedform" method="get" action="/admin/buildm3u">
                                        <p>
                                            <label for="name">Username:
                                            </label>
                                            <input id="name" name="username" type="text" />
                                        </p>
                                        <p>
                                            <label for="password">Password:
                                            </label>
                                            <input id="password" name="password" type="password" />
                                        </p>
                                        <input type="hidden" name="mount" value="{@mount}" />
                                        <input type="submit" value="Login" />
                                    </form>
                                </div>
                            </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                            <h3>
                                <xsl:value-of select="@mount" /> - Not Connected </h3>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <div id="footer"> Bitscoper Radio | © <a href="https://github.com/bitscoper/"
                        title="Abdullah As-Sadeed" target="new">Abdullah As-Sadeed</a>
                </div>
                <script src="Bitscoper_Radio.js"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>