<#macro htmlEmailLayout accentColor="#1B5E20" category="GÉNÉRAL">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body style="margin:0;padding:0;background-color:#EEEEE8;font-family:Arial,Helvetica,sans-serif;-webkit-text-size-adjust:100%;mso-line-height-rule:exactly;">
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#EEEEE8;">
  <tr>
    <td align="center" style="padding:28px 16px;">
      <table role="presentation" width="600" cellpadding="0" cellspacing="0" border="0" style="max-width:600px;width:100%;background-color:#ffffff;">

        <!-- Top accent stripe -->
        <tr>
          <td style="height:4px;background-color:${accentColor};font-size:0;line-height:0;">&nbsp;</td>
        </tr>

        <!-- Header: logo + category -->
        <tr>
          <td style="padding:16px 24px 14px;border-bottom:1px solid #EEEEE8;">
            <table role="presentation" cellpadding="0" cellspacing="0" border="0">
              <tr>
                <td style="vertical-align:middle;">
                  <img src="${url.resourcesPath}/images/portalis/Logo.png" alt="PortaLis" style="height:40px;width:auto;display:block;border:0;" />
                </td>
                <td style="vertical-align:middle;">
                  <p style="margin:0;font-size:15px;font-family:Playfair Display;line-height:1.2;">
                      <strong style="color:#1B5E20;font-family:'Playfair Display';font-size:22px;font-style:normal;font-weight:700;line-height:33px;letter-spacing:-0.44px;">PortaLis</strong><span style="color:#F9A825;font-family:Inter;font-size:13px;font-style:normal;font-weight:600;line-height:19.5px;margin-left:4px;">Sénégal</span>
                  </p>
                  <p style="margin:2px 0 0;font-size:9px;color:#9CA3AF;text-transform:uppercase;letter-spacing:0.08em;font-family:Arial,Helvetica,sans-serif;">${category}</p>
                </td>
              </tr>
            </table>
          </td>
        </tr>

        <!-- Child template rows -->
        <#nested>

        <!-- Footer -->
        <tr>
          <td style="background-color:#1B5E20;padding:20px 32px;text-align:center;">
            <p style="margin:0 0 4px;color:#ffffff;font-size:13px;font-weight:700;font-family:Arial,Helvetica,sans-serif;">PortaLis Sénégal</p>
            <p style="margin:0 0 10px;color:rgba(255,255,255,0.65);font-size:11px;font-family:Arial,Helvetica,sans-serif;">Transport &amp; Logistique · Afrique de l'Ouest</p>
            <p style="margin:0;font-size:11px;font-family:Arial,Helvetica,sans-serif;">
              <a href="#" style="color:rgba(255,255,255,0.6);text-decoration:underline;">Se désabonner</a>
              <span style="color:rgba(255,255,255,0.4);">&nbsp;·&nbsp;</span>
              <a href="#" style="color:rgba(255,255,255,0.6);text-decoration:underline;">Politique de confidentialité</a>
            </p>
          </td>
        </tr>

      </table>
    </td>
  </tr>
</table>
</body>
</html>
</#macro>
