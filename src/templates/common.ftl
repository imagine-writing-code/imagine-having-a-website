<#ftl strip_text=true />

<#---
  Shared, generic macros, functions, and variables

  @namespace c
-->

<#---
  Global imports
-->
<#import "page.ftl" as page />
<#import "ui.ftl" as ui />

<#global page = page />
<#global ui = ui />


<#---
  Common variables
-->
<#assign locale = pp.locale?lower_case?replace("_","-") /><#-- preferred locale format, e.g. en-us instead of en_US -->
<#assign lang = pp.locale?substring(0, 2) />
<#assign dateFormat = "MMMM d, yyyy h:mm a zzz" /><#-- matches date setting in config.fmpp -->
<#assign fullDate = "EEEE, MMMM d, yyyy, h:mm a zzz" />

<#assign context = pp.home /><#-- App context -->
<#assign domain = domain /><#-- from config.fmpp -->
<#assign fullDomain = "http://" + domain /><#-- domain + protocol -->
