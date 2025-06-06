// use ferris_says::say;
// use std::io::{BufWriter, stdout};

fn main() {
    // let stdout = stdout();
    // let message = String::from("hello fellow Rustaceans~");
    // let width = message.chars().count();

    // let mut writer = BufWriter::new(stdout.lock());
    // say(&message, width, &mut writer).unwrap();

    let mut array = ["1212", "asd", "asd"];

    for v in array.iter() {
        // v += "_suffix"; // 这里会报错，因为 v 是不可变的引用
        // 如果需要修改，可以使用
        let mut v = v.to_string();
        v += "_suffix";

        println!("{}", v)
    }
    println!("-------------------------");

    // array 加了 mut 之后，可以修改数组的元素
    array[0] = "new_value"; // 修改数组的第一个元素
    for v in array.iter() {
        println!("{}", v)
    }

    println!("-------------------------");

    // 变量可以用表达式初始化
    let y = {
        let x = 3;
        x + 1 // 这里不能加分号，奇葩
    };

    println!("The value of y is: {}", y);

    println!("-------------------------");

    // rust 允许数字以下划线分割，便于阅读
    let mut a: i32 = 1_1_1; // 111
    a += 1;

    println!("{}", add(a, 2));

    println!("-------------------------");

    // 三元表达式的写法
    let xx = if 1 == 1 { 2 } else { 3 };
    println!("The value of xx is: {}", xx);

    println!("-------------------------");

    println!("plus_or_minus(6) = {}", plus_or_minus(6));
}

fn add(a: i32, b: i32) -> i32 {
    return a + b;
}

fn plus_or_minus(x: i32) -> i32 {
    if x > 5 {
        return x - 5;
    }

    // x + 5 // 不加分号的返回值
    // 等价于带分号的正常 return，奇葩
    return x + 5;
}
