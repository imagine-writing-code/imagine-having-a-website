<#ftl strip_text=true />

<#---
  UI-related directives

  @namespace ui
-->


<#---
  Outputs an unordered list of breadcrumbs
  @param crumbs
-->
<#macro breadcrumb crumbs=[]>
  <#local crumbs = [{
    "title": "Home",
    "url": pp.pathTo('/index.html')
  }] + crumbs />
  <ul class="breadcrumb"><#t />
    <#list crumbs as crumb>
      <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><#t />
        <a title="${crumb.title?xhtml}" href="${crumb.url}" itemprop="url"><#t />
          <span itemprop="title">${crumb.title?xhtml}</span><#t />
        </a><#t />
      </li><#t />
    </#list>
  </ul><#t />
</#macro>
