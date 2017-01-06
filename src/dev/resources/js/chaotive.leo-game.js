System.config({
    packages: {
        "ts": {
            "main": "plugin-typescript-5.3.3.js"
        },
        "typescript": {
            "main": "typescript-2.1.4.js",
            "meta": {
                "typescript-2.1.4.js": {
                    "exports": "ts"
                }
            }
        },
        "leo-game": {
            "defaultExtension": "ts",
            "main": "LeoApp.ts",
            "meta": {
                "*.ts": {
                    "loader": "ts"
                }
            }
        }
    },
    map: {
        "ts": "../../../lib/dev/ts",
        "typescript": "../../../lib/dev/ts",
        "leo-game": '../../main/ts/CHAOTIVE/LEO-GAME'
    },
    transpiler: "ts"
});

window.start = function() {
    console.log("Chaotive framework initialized...");
    System.import('leo-game').then( function(lg) {
        window.app = new lg.LeoApp("dev");
    });
};
