document.getElementById('login-form').addEventListener('submit', function (e) {
    e.preventDefault();
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    const users = JSON.parse(localStorage.getItem('users')) || [];
    const user = users.find(user => user.email === email && user.password === password);

    if (user) {
        console.log('User found:', user);
        sessionStorage.setItem('currentUser', JSON.stringify(user));
        window.location.href = 'index.html';
    } else {
        const errorMessage = document.getElementById('error-message');
        errorMessage.textContent = 'Invalid email or password.';
        errorMessage.style.display = 'block';
    }
});
