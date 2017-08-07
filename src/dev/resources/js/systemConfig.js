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
        "SG": {
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
        "SG": '../../main/ts/SG'
    },
    transpiler: "ts"
});