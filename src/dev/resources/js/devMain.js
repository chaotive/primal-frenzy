window.start = function() {
    System.import('SG').then( function(imports) {
        window.app = new imports.App("dev");
    });
};
