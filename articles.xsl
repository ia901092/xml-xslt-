<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>

<xsl:template match="/">
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Articles</title>
</head>
<body>
    <xsl:apply-templates select="ARTICLES/NEWSPAPER"/>
</body>
</html>
</xsl:template>

<xsl:template match="NEWSPAPER">
<table class="newspaper">
    <tbody>
        <tr>
            <td>
                NAME: <xsl:value-of select="@NAME"/><br/>
                SUBSCRIBERS: <xsl:value-of select="@SUBSCRIBERS"/><br/>
                TYPE: <xsl:value-of select="@TYPE"/>
            </td>
        </tr>
        <tr>
            <td>
                <table class="articles">
                    <tbody>
                        <xsl:apply-templates select="ARTICLE"/>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>
</xsl:template>

<xsl:template match="ARTICLE">
    <xsl:choose>
        <xsl:when test="@DESCRIPTION='News'">
            <tr>
                <td class="news">
                    ID: <xsl:value-of select="@ID"/><br/>
                    TIME: <xsl:value-of select="@TIME"/><br/>
                    DESCRIPTION: <xsl:value-of select="@DESCRIPTION"/><br/>
                    <xsl:apply-templates select="HEADING|STORY"/>
                </td>
            </tr>
        </xsl:when>
        <xsl:otherwise>
            <tr>
                <td class="review">
                    ID: <xsl:value-of select="@ID"/><br/>
                    TIME: <xsl:value-of select="@TIME"/><br/>
                    DESCRIPTION: <xsl:value-of select="@DESCRIPTION"/><br/>
                    <xsl:apply-templates select="HEADING|STORY"/>
                </td>
            </tr>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="ARTICLE/HEADING">
    <h3><xsl:value-of select="TEXT"/></h3>
</xsl:template>

<xsl:template match="STORY">
    <div class="story">
        <xsl:for-each select="TEXT">
            <p><xsl:value-of select="."/></p>
        </xsl:for-each>
    </div>
</xsl:template>

</xsl:stylesheet>