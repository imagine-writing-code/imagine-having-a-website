<#ftl strip_text=true />

<#---
  SEO-related directives

  @namespace seo
-->



<#---
  Returns a canonical url
  @param outputFile string
  @param baseDomain string containing the domain. Do not include a trailing slash
  @param prettyUrls boolean to determine if the urls should be "pretty",  e.g. "/foo/bar.html" would get changed to "/foo/bar" and "foo/index.html" would become "foo/"
  @returns url
-->
<#function canonicalUrl outputFile baseDomain=c.fullDomain prettyUrls=true>

  <#if prettyUrls>
    <#if outputFile?ends_with("index.html")>
      <#local outputFile = outputFile?replace("index.html", "") />
    <#elseif outputFile?ends_with(".html")>
      <#-- trim none index pages -->
      <#local outputFile = outputFile?replace(".html", "") />
    </#if>
  </#if>

  <#local url = baseDomain + "/" + outputFile />

  <#return url />

</#function>
