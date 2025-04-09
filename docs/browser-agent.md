# **Documentação: Configuração de CORS para Cabeçalho Personalizado `Browser-Agent`**

É usada para armazenar a **fingerprint** do navegador quando o cliente realiza o primeiro acesso ao aplicativo.

Isso permite uma maior rastreabilidade, o que pode nos ajudar a prevenir ao menos ataques de trolls que não entendem tanto de navegadores.

## **Descrição**

Este guia descreve como configurar o servidor para aceitar o cabeçalho personalizado `Browser-Agent` em requisições, resolvendo erros de **CORS (Cross-Origin Resource Sharing)**.

## **Problema**

Ao adicionar o cabeçalho `Browser-Agent` em requisições no cliente, o navegador bloqueia a requisição com um erro de CORS, pois o servidor não permite este cabeçalho por padrão.

## **Solução**

### **No Servidor**

Adicione o cabeçalho `Browser-Agent` à lista de cabeçalhos permitidos na configuração de CORS do servidor.

**Exemplo com Laravel (config/cors.php):**

```php
return [
    'paths' => ['api/*', 'sanctum/csrf-cookie'],
    'allowed_methods' => ['*'],
    'allowed_origins' => ['*'], // Atualize para o domínio correto
    'allowed_headers' => ['Content-Type', 'Authorization', 'Browser-Agent'], // Inclua o cabeçalho
    'exposed_headers' => [],
    'max_age' => 0,
    'supports_credentials' => true,
];
```

**Exemplo no `.conf` do nginx**

A header deve ser adicionada na clausula de Headers autorizadas

```conf
add_header 'Access-Control-Allow-Headers' 'Origin, Authorization, Accept, Content-Type, X-Requested-With, Browser-Agent';
```

### **No Cliente**

No cliente, configure o cabeçalho após a obtenção do valor `Browser-Agent`:

```javascript
useEffect(() => {
  const storedBrowserAgent = cookies[AUTH_BROWSER_AGENT_KEY];

  if (!storedBrowserAgent || !validateBrowserAgent(storedBrowserAgent)) {
    api.get("/fingerprint").then(({ data }) => {
      api.defaults.headers["Browser-Agent"] = data.fingerprint;
      setAuthBrowserAgent(data.fingerprint);
      setCookie(AUTH_BROWSER_AGENT_KEY, data.fingerprint);
    });
  } else {
    api.defaults.headers["Browser-Agent"] = storedBrowserAgent;
  }
}, [cookies, setCookie]);
```
