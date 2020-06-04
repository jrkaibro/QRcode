<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:gx="urn:shemas-artech-com:gx"
	exclude-result-prefixes="msxml gx"
	xmlns:gxca="urn:GXControlAdap">
  <xsl:output method="html"/>
  <xsl:template match="/" >
    <xsl:apply-templates select="/GxControl"/>
  </xsl:template>
  <xsl:template match="GxControl">
    <xsl:choose>
      <xsl:when test="@type = 'KnetQRCode'">
        <xsl:call-template name="RenderKnetQRCode"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <!-- KnetQRCode design render -->
  <!-- ///////////////////  Implement your render here  ///////////////////-->
  <xsl:template name="RenderKnetQRCode">
    <span atomicselection="true">
      <xsl:call-template name="AddStyleAttribute"/>
      
      
    <div>      
	   <xsl:attribute name ="id">KnetQRCode</xsl:attribute>
   	  <img>
        <xsl:attribute name ="src">
          <xsl:value-of select='gxca:GetMyPath()'/>
          <xsl:text>\icon\Knet.png</xsl:text>
        </xsl:attribute>
        <xsl:attribute name ="width">
          <xsl:value-of select="gxca:GetPropertyValueInt('Width')"/>
        </xsl:attribute>
        <xsl:attribute name ="height">
          <xsl:value-of select="gxca:GetPropertyValueInt('Height')"/>
        </xsl:attribute>
      </img>
	</div>  
      
      
      
    </span>


  </xsl:template>


  <!-- Helpers Templates -->

  <xsl:template name="AddStyleAttribute" >
    <xsl:variable name="Style">
      <xsl:text>width: </xsl:text>
      <xsl:value-of select="gxca:GetPropertyValueInt('Width')"/>
      <xsl:text>; </xsl:text>
      <xsl:text>height: </xsl:text>
      <xsl:value-of select="gxca:GetPropertyValueInt('Height')"/>
      <xsl:text>; </xsl:text>
      <xsl:text>border-style: solid;	border-width: 2px;</xsl:text>
    </xsl:variable>
    <xsl:attribute name="style">
      <xsl:value-of select="$Style"/>
    </xsl:attribute>
  </xsl:template>
</xsl:stylesheet>
