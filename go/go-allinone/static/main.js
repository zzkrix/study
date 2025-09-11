function updateTime() {
	document.getElementById('time').textContent = new Date().toLocaleString();
}
updateTime();
setInterval(updateTime, 1000);
