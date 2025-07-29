// use ferris_says::say;
// use std::io::{BufWriter, stdout};

use std::thread::sleep;

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

        println!("{v}")
    }
    println!("-------------------------");

    // array 加了 mut 之后，可以修改数组的元素
    array[0] = "new_value"; // 修改数组的第一个元素
    for v in array.iter() {
        println!("{v}")
    }

    println!("-------------------------");

    // 变量可以用表达式初始化
    let y = {
        let x = 3;
        x + 1 // 这里不能加分号，奇葩
    };

    println!("The value of y is: {y}");

    println!("-------------------------");

    // rust 允许数字以下划线分割，便于阅读
    let mut a: i32 = 1_1_1; // 111
    a += 1;

    println!("{}", add(a, 2));

    println!("-------------------------");

    // 三元表达式的写法
    let xx = if true { 2 } else { 3 };
    println!("The value of xx is: {xx}");

    println!("-------------------------");

    println!("plus_or_minus(6) = {}", plus_or_minus(6));

    println!("--------------------------");

    let addfunc = |a: i32, b: i32| a + b;

    println!("{}", addfunc(1, 2));

    // Option: Some / None
    let numbers = [1, 2, 3, 4, 5];
    let target = 3;
    match find_element(&numbers, target) {
        Some(index) => println!("找到了元素，索引是：{index}"),
        None => println!("没有找到元素"),
    }

    let some_value = Some(10);
    if let Some(value) = some_value {
        println!("Some中的值是：{value}");
    }

    loop_forever()
}

fn find_element(arr: &[i32], target: i32) -> Option<usize> {
    for (index, &value) in arr.iter().enumerate() {
        if value == target {
            return Some(index); // 找到元素，返回其索引
        }
    }
    None // 没有找到元素，返回 None
}

fn add(a: i32, b: i32) -> i32 {
    a + b
}

fn plus_or_minus(x: i32) -> i32 {
    if x > 5 {
        return x - 5;
    }

    // 等价于带分号的正常 return，奇葩
    // return x + 5;
    x + 5 // 不加分号的返回值

    // 如果函数最后一行没有表达式，也没有 return，则默认返回 (), 例如
    // fn foo() -> () {
    //     println!("Hello, world!");
    // }
}

// 用不返回的发散函数
fn loop_forever() -> ! {
    // 这个函数永远不会返回，类型是 !
    // ! 是 Rust 中的特殊类型，表示永远不会有返回值
    loop {
        println!("This will loop forever!");
        sleep(std::time::Duration::from_secs(1));
    }
}
