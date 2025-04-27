export interface Person {
    name: string;
    age: number;
}

// 两种方式都可以
// export type Persons = Person[];
export type Persons = Array<Person>;
