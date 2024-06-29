document.getElementById('register-form').addEventListener('submit', function (e) {
    e.preventDefault();
    const username = document.getElementById('username').value;
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const photo = document.getElementById('photo').files[0];

    const users = JSON.parse(localStorage.getItem('users')) || [];
    const userExists = users.some(user => user.email === email);

    if (userExists) {
        const errorMessage = document.getElementById('error-message');
        errorMessage.textContent = 'User already exists.';
        errorMessage.style.display = 'block';
    } else {
        const reader = new FileReader();
        reader.onloadend = function () {
            const newUser = {
                username,
                email,
                password,
                photo: reader.result,
                role: 'user',
                pronouns: '',
                bio: '',
                banner: null,
                bannerType: null
            };
            users.push(newUser);
            localStorage.setItem('users', JSON.stringify(users));
            const successMessage = document.getElementById('success-message');
            successMessage.textContent = 'Registration successful!';
            successMessage.style.display = 'block';
        };
        if (photo) {
            reader.readAsDataURL(photo);
        } else {
            const newUser = {
                username,
                email,
                password,
                photo: null,
                role: 'user',
                pronouns: '',
                bio: '',
                banner: null,
                bannerType: null
            };
            users.push(newUser);
            localStorage.setItem('users', JSON.stringify(users));
            const successMessage = document.getElementById('success-message');
            successMessage.textContent = 'Registration successful!';
            successMessage.style.display = 'block';
        }
    }
});
