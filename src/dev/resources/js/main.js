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
        "some-game": {
            "defaultExtension": "ts",
            "main": "App.ts",
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
        "some-game": '../../main/ts/SOME-GAME'
    },
    transpiler: "ts"
});

window.start = function() {
    System.import('some-game').then( function(sg) {
        window.app = new sg.App("dev");
    });
};
