/**
 * Created by leo on 02-01-2017.
 */

class Student {
    fullName: string;
    constructor(public firstName, public middleInitial, public lastName) {
        this.fullName = firstName + " " + middleInitial + " " + lastName;
    }
}

interface Person {
    firstName: string;
    lastName: string;
}

function greeter(person : Person) {
    return "Hello, " + person.firstName + " " + person.lastName;
}

function tryToGreet(): any {
    try {
        let user = new Student("Typescript", "Is.", "Working");
        let newcontent = document.createElement('div');
        newcontent.innerHTML = greeter(user);

        document.body.appendChild(newcontent);
    } catch (e) {
        console.log(e);
        setTimeout(tryToGreet, 100)
    }
}

window.onload = tryToGreet();
