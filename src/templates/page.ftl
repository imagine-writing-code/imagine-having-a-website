<#ftl strip_text=true />

<#--
  Shared, page-related macros, functions, and variables

  @namespace page
-->



<#---
  Imports
-->
<#import "seo.ftl" as seo />
<#import "social-media.ftl" as socialMedia />
<#import "header.ftl" as header />
<#import "footer.ftl" as footer />


<#---
  Shared vars
-->
<#assign titleSuffix = " — IHAG" />


<#---
  Default preamble to the page
-->
<#macro preamble>
  <!doctype html>
</#macro>


<#---
  Default page macro

  @param title the list of stylesheets
  @param bodyClass
  @param stylesheets the list of stylesheets to be included on page
  @param scripts the list of scripts to be included on the page
  @param ogData object containing open graph properties
  @param activeTab
  @param sitemap data for the sitemap
  @param itemtype
-->
<#macro page title="" bodyClass="" stylesheets=[] scripts=[] ogData={} activeTab="home" sitemap={} itemtype="https://schema.org/WebPage">
  <@collectPage title=title sitemap=sitemap />
  <#compress>
    <@preamble />
    <html lang="${c.lang}">
    <head prefix="og: http://ogp.me/ns#">
      <@charset />
      <#if title?has_content>
        <title>${title} - Imagine Having a Guild</title>
      <#else>
        <title>Imagine Having a Guild</title>
      </#if>
      <@defaultMetaTags />
      <link rel="stylesheet" type="text/css" href="css/styles.css">
      <link rel="shortcut icon" href="favicon.png" type="image/x-icon">
    </head>
    <body<#if bodyClass?has_content> class="${bodyClass}"</#if> itemscope itemtype="${itemtype}">
      <meta itemprop="dateModified" content="${pp.now?iso("America/Los_Angeles")}">
      <@header.header />
      <div class="page-width">
        <@pageNav activeTab=activeTab />
      </div>
      <main class="page-width" role="main">
        </#compress><#nested /><#compress>
      </main>
      <#-- footer -->
      <@footer.wrapper>
        <@footer.copyright />
      </@footer.wrapper>
      <script>
        var whTooltips = {
          colorLinks: true,
          iconizeLinks: true,
          renameLinks: true
        };
      </script>
      <script src="https://wow.zamimg.com/widgets/power.js"></script>
    </body>
    </html>
  </#compress>
</#macro>

<#---
  Adds to the list of pages for use in the sitemap and various navigations
  @param title string containing the title of the page
  @param sitemap data for the sitemap
-->
<#macro collectPage title sitemap>
  <#if !pp.s.pages??>
    <@pp.set hash=pp.s key="pages" value=pp.newWritableSequence() />
  </#if>
  <@pp.add seq=pp.s.pages
      value={
        "url": pp.pathTo(pp.outputFile),
        "title": title,
        "outputFile": pp.outputFile,
        "sitemap": sitemap
      }/>
</#macro>


<#---
  Charset meta tag
  Keep this separate from "defaultMetaTags" since it should go above the <title> tag
-->
<#macro charset>
  <meta charset="utf-8">
</#macro>


<#---
  Default meta tags
-->
<#macro defaultMetaTags>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <meta name="format-detection" content="telephone=no">
</#macro>


<#---
  @param activeTab
-->
<#macro pageNav activeTab>
  <#local links = [
    {
      "key": "home",
      "url": "/index.html",
      "title": "DKP table"
    }, {
      "key": "dkp-history",
      "url": "/dkp-history.html",
      "title": "DKP history"
    }, {
      "key": "loot-history",
      "url": "/loot-history.html",
      "title": "Loot history"
    }
  ] />
  <nav class="main-nav" role="navigation"><#t>
    <ul><#t>
      <#list links as link>
        <li itemscope itemtype="http://schema.org/SiteNavigationElement"><#t>
          <a itemprop="url" href="${pp.pathTo(link.url)}"<#if activeTab == link.key> class="active"</#if>><span itemprop="name">${link.title}</span></a><#t>
        </li><#t>
      </#list>
    </ul><#t>
  </nav><#t>
</#macro>
