document.addEventListener("DOMContentLoaded", function() {
    const params = new URLSearchParams(window.location.search);
    const gameId = params.get("id");

    const games = {
        dark_souls_2: {
            title: "Dark Souls II",
            image: "Imagens/Items_Loja/Darksouls_2.jpg",
            description: "An action RPG game set in a dark fantasy world.",
            platform: "PC, PS4, Xbox One",
            price: "$39.99",
            discount: "20%"
        },
        dragon_ball_fighterz: {
            title: "Dragon Ball FighterZ",
            image: "Imagens/Items_Loja/Dragonball_FighterZ.jpg",
            description: "A fighting game featuring characters from the Dragon Ball series.",
            platform: "PC, PS4, Xbox One",
            price: "$49.99",
            discount: "10%"
        },
        dragon_ball_sparking_zero: {
            title: "Dragon Ball Sparking Zero",
            image: "Imagens/Items_Loja/Dragonball_Sparkinzero.jpg",
            description: "An action game based on the Dragon Ball series.",
            platform: "PC, PS4, Xbox One",
            price: "$59.99",
            discount: "15%"
        },
        dragon_ball_z_kakarot: {
            title: "Dragon Ball Z Kakarot",
            image: "Imagens/Items_Loja/Dragonballz_Kakorot.jpg",
            description: "An action RPG game set in the Dragon Ball Z universe.",
            platform: "PC, PS4, Xbox One",
            price: "$59.99",
            discount: "20%"
        },
        elden_ring: {
            title: "Elden Ring",
            image: "Imagens/Items_Loja/EldenRing.jpg",
            description: "An open-world action RPG game.",
            platform: "PC, PS4, Xbox One",
            price: "$59.99",
            discount: "25%"
        },
        tekken_7: {
            title: "Tekken 7",
            image: "Imagens/Items_Loja/Tekken7.jpg",
            description: "A fighting game from the Tekken series.",
            platform: "PC, PS4, Xbox One",
            price: "$49.99",
            discount: "30%"
        },
        tekken_8: {
            title: "Tekken 8",
            image: "Imagens/Items_Loja/Tekken8.jpg",
            description: "The latest installment in the Tekken series.",
            platform: "PC, PS4, Xbox One",
            price: "$59.99",
            discount: "20%"
        },
        tekken_8_collectors: {
            title: "Tekken 8 Collector's Edition",
            image: "Imagens/Items_Loja/Tekken8_Collectors_Edition.jpg",
            description: "Collector's edition of Tekken 8 with exclusive content.",
            platform: "PC, PS4, Xbox One",
            price: "$99.99",
            discount: "10%"
        },
        tekken_8_ultimate: {
            title: "Tekken 8 Ultimate Edition",
            image: "Imagens/Items_Loja/Tekken8_Ultimate_Edition.jpg",
            description: "Ultimate edition of Tekken 8 with additional features.",
            platform: "PC, PS4, Xbox One",
            price: "$79.99",
            discount: "15%"
        },
        tekken_8_figurine_fist_meets_fate: {
            title: "Tekken 8: Fist Meets Fate Figurine",
            image: "Imagens/Items_Loja/Tekken8_Figurine_Fist_Meets_Fate.jpg",
            description: "A detailed figurine depicting a fight scene from Tekken 8.",
            platform: "N/A",
            price: "$149.99",
            discount: "5%"
        },
        tekken_8_figurine_jin_kazama: {
            title: "Tekken 8: Jin Kazama Figurine",
            image: "Imagens/Items_Loja/Tekken8_Figurine_Jin_kazama.jpg",
            description: "A high-quality figurine of Jin Kazama from Tekken 8.",
            platform: "N/A",
            price: "$79.99",
            discount: "10%"
        },
        tekken_8_figurine_kazuya_mishima: {
            title: "Tekken 8: Kazuya Mishima Figurine",
            image: "Imagens/Items_Loja/Tekken8_Figurine_Kazuya_Mishima.jpg",
            description: "A high-quality figurine of Kazuya Mishima from Tekken 8.",
            platform: "N/A",
            price: "$89.99",
            discount: "10%"
        }
    };

    if (games[gameId]) {
        document.getElementById("game-title").textContent = games[gameId].title;
        document.getElementById("game-image").src = games[gameId].image;
        document.getElementById("game-description").textContent = games[gameId].description;
        document.getElementById("game-platform").textContent = "Platform: " + games[gameId].platform;
        document.getElementById("game-price").textContent = "Price: " + games[gameId].price;
        document.getElementById("game-discount").textContent = "Discount: " + games[gameId].discount;
    } else {
        document.getElementById("game-title").textContent = "Game not found";
    }
});

