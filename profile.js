document.addEventListener('DOMContentLoaded', function () {
    const currentUser = JSON.parse(sessionStorage.getItem('currentUser'));
    console.log('Current User:', currentUser);

    if (currentUser) {
        loadProfile(currentUser);

        document.getElementById('edit-profile-form').addEventListener('submit', function (e) {
            e.preventDefault();
            saveProfile(currentUser);
        });

        document.getElementById('edit-username').addEventListener('input', function () {
            document.getElementById('preview-username').textContent = this.value;
        });
        document.getElementById('edit-pronouns').addEventListener('input', function () {
            document.getElementById('preview-pronouns').textContent = this.value;
        });
        document.getElementById('edit-bio').addEventListener('input', function () {
            document.getElementById('preview-bio').textContent = `Bio: ${this.value}`;
        });
        document.getElementById('edit-photo').addEventListener('change', function () {
            handleFileUpload(this.files[0], 'photo', currentUser);
        });
        document.getElementById('edit-banner').addEventListener('change', function () {
            handleFileUpload(this.files[0], 'banner', currentUser);
        });
    } else {
        window.location.href = 'login.html';
    }
});

function loadProfile(user) {
    console.log('Loading profile for user:', user);
    document.getElementById('edit-username').value = user.username;
    document.getElementById('preview-username').textContent = user.username;

    document.getElementById('edit-pronouns').value = user.pronouns;
    document.getElementById('preview-pronouns').textContent = user.pronouns;

    document.getElementById('edit-bio').value = user.bio;
    document.getElementById('preview-bio').textContent = `Bio: ${user.bio}`;

    if (user.photo) {
        displayMedia('photo', user.photo, user.photoType);
    }

    if (user.banner) {
        displayMedia('banner', user.banner, user.bannerType);
    }
}

function handleFileUpload(file, type, user) {
    const reader = new FileReader();
    reader.onloadend = function () {
        const result = reader.result;
        if (file.type.startsWith('video')) {
            user[type] = result;
            user[`${type}Type`] = 'video';
            displayMedia(type, result, 'video');
        } else if (file.type.startsWith('image')) {
            user[type] = result;
            user[`${type}Type`] = 'image';
            displayMedia(type, result, 'image');
        } else {
            console.error('Unsupported file type');
        }
        sessionStorage.setItem('currentUser', JSON.stringify(user));
    };
    reader.readAsDataURL(file);
}

function displayMedia(type, src, mediaType) {
    console.log(`Displaying ${mediaType} for ${type}:`, src);
    const imgElement = document.getElementById(`preview-${type}-img`);
    const videoElement = document.getElementById(`preview-${type}-video`);

    if (mediaType === 'video') {
        imgElement.style.display = 'none';
        videoElement.style.display = 'block';
        videoElement.src = src;
        videoElement.onloadeddata = function () {
            videoElement.play();
        };
    } else if (mediaType === 'image') {
        videoElement.style.display = 'none';
        imgElement.style.display = 'block';
        imgElement.src = src;
    }
}

function saveProfile(user) {
    user.username = document.getElementById('edit-username').value;
    user.pronouns = document.getElementById('edit-pronouns').value;
    user.bio = document.getElementById('edit-bio').value;

    const photo = document.getElementById('edit-photo').files[0];
    const banner = document.getElementById('edit-banner').files[0];

    console.log('Saving profile:', user);
    console.log('Photo file:', photo);
    console.log('Banner file:', banner);

    const users = JSON.parse(localStorage.getItem('users')) || [];
    const userIndex = users.findIndex(u => u.email === user.email);

    const updateLocalStorage = () => {
        console.log('Updating local storage for user:', user);
        if (userIndex > -1) {
            users[userIndex] = user;
            localStorage.setItem('users', JSON.stringify(users));
            sessionStorage.setItem('currentUser', JSON.stringify(user));
            window.location.reload();
        } else {
            console.error('User not found in local storage');
        }
    };

    const handleFileRead = (file, type, callback) => {
        const reader = new FileReader();
        reader.onloadend = function() {
            console.log(`File read for ${type}:`, reader.result.slice(0, 100)); // Log first 100 chars
            if (type === 'photo') {
                user.photo = reader.result;
                user.photoType = file.type.startsWith('video') ? 'video' : 'image';
            } else if (type === 'banner') {
                user.banner = reader.result;
                user.bannerType = file.type.startsWith('video') ? 'video' : 'image';
            }
            callback();
        };
        reader.readAsDataURL(file);
    };

    if (photo && banner) {
        handleFileRead(photo, 'photo', () => {
            handleFileRead(banner, 'banner', updateLocalStorage);
        });
    } else if (photo) {
        handleFileRead(photo, 'photo', updateLocalStorage);
    } else if (banner) {
        handleFileRead(banner, 'banner', updateLocalStorage);
    } else {
        updateLocalStorage();
    }
}


