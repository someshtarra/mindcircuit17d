<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jenkins HTML Demo</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
    <h1>🚀 Jenkins Pipeline Successful!</h1>
    <p>This HTML page was deployed using Jenkins CI/CD.</p>

    <button onclick="showMessage()">Click Me</button>

    <p id="msg"></p>
</div>

<script>
function showMessage() {
    document.getElementById("msg").innerHTML =
    "Deployment verified successfully using Jenkins!";
}
</script>

</body>
</html>
