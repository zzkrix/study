// API 调用函数
export async function getHello() {
    try {
        const response = await fetch("/api/hello");
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return await response.json();
    } catch (error) {
        console.error("API 调用出错：", error);
        throw error;
    }
}
