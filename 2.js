(async ()=> {
    const argon2 = require('argon2');
    const confere = await argon2.verify("$argon2id$v=19$m=65536,t=3,p=4$/2sdeWJ69DZMWem/XTE5Aw$2+SSY/fzXzpWvdzxtzEcMZlDBptKm0NGVepox6EnJVo", "123")
    console.log(confere)
})();
