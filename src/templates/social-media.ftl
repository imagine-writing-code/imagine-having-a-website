<#ftl strip_text=true />

<#---
  Macros, functions, and variables related to social media

  @namespace socialMedia
-->


<#---
  Outputs open graph meta tags
  @param title string containing the fallback to use for og:title
  @param url string containing the fallback to use for og:url
  @param ogData object containing open graph properties
-->
<#macro openGraph title url="" ogData={}>

  <#-- title -->
  <#if ogData.title??>
    <#local title = ogData.title />
  </#if>
  <meta property="og:title" content="${title?xhtml}">

  <#-- locale -->
  <meta property="og:locale" content="${pp.locale}">

  <#-- url -->
  <#if ogData.url??>
    <#local url = ogData.url />
  </#if>
  <meta property="og:url" content="${url?xhtml}">

  <#-- url -->
  <#if ogData.desc??>
    <meta property="og:description" content="${ogData.desc?xhtml}">
  </#if>

</#macro>
