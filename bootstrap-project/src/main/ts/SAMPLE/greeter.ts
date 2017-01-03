/**
 * Created by leo on 02-01-2017.
 */

function greeter(person: string) {
    return "Hello, " + person;
}

var user = "Jane User";

document.body.innerHTML = greeter(user);
