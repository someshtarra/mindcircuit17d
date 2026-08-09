<!DOCTYPE html>
<html lang="en">
<h1> HI I AM SOMESH </h1>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Server Status Checker</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f6f8;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .card {
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      width: 360px;
      text-align: center;
    }
    input {
      width: 100%;
      padding: 10px;
      margin: 15px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
    }
    button {
      width: 100%;
      padding: 10px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      font-weight: bold;
      cursor: pointer;
    }
    button:hover {
      background-color: #0056b3;
    }
    #statusResult {
      margin-top: 20px;
      font-size: 16px;
      font-weight: bold;
    }
    .online { color: #28a745; }
    .offline { color: #dc3545; }
    .checking { color: #ffc107; }
  </style>
</head>
<body>

  <div class="card">
    <h2>Server Checker</h2>
    <input type="text" id="serverUrl" placeholder="https://example.com" value="https://httpbin.org/get">
    <button onclick="checkServer()">Check Status</button>
    <div id="statusResult"></div>
  </div>

  <script>
    async function checkServer() {
      const urlInput = document.getElementById('serverUrl').value.trim();
      const resultDiv = document.getElementById('statusResult');

      if (!urlInput) {
        resultDiv.innerHTML = "<span class='offline'>Please enter a URL.</span>";
        return;
      }

      // Add https:// if user didn't type a protocol
      let formattedUrl = urlInput;
      if (!/^https?:\/\//i.test(formattedUrl)) {
        formattedUrl = 'https://' + formattedUrl;
      }

      resultDiv.className = 'checking';
      resultDiv.innerText = 'Checking...';

      const startTime = performance.now();

      try {
        // 'no-cors' mode allows reaching cross-origin servers without throwing a CORS error,
        // though response content cannot be read.
        await fetch(formattedUrl, { method: 'GET', mode: 'no-cors', cache: 'no-store' });
        
        const endTime = performance.now();
        const latency = Math.round(endTime - startTime);

        resultDiv.className = 'online';
        resultDiv.innerHTML = `🟢 Server is UP<br><small>Response time: ~${latency} ms</small>`;
      } catch (error) {
        resultDiv.className = 'offline';
        resultDiv.innerHTML = '🔴 Server is DOWN or Unreachable';
      }
    }
  </script>

</body>
</html>
