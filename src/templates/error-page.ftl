<#macro errorPage title>
  <#compress>
    <@page.preamble />
    <html lang="${c.lang}">
      <head>
        <@page.charset />
        <title>${title + page.titleSuffix}</title>
        <@page.defaultMetaTags />
        <meta name="robots" content="noindex">
        <@css />
      </head>
      <body>
        <main role="main">
          <h1>${title}</h1>
          <#nested />
          <p><a href="${c.fullDomain}">Continue to ${c.domain}</a></p>
        </main>
      </body>
    </html>
  </#compress>
</#macro>


<#macro css>
  <style type="text/css">
    html {
      font-family: sans-serif;
      color: #333;
      background-color: #fff;
    }
    body {
      margin: 0;
    }
    h1 {
      margin: 0;
      font-weight: normal;
    }
    main {
      display: block;
      padding: 40px;
    }
  </style>
</#macro>
