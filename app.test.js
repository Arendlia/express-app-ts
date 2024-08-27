const request = require("supertest")

const app = require("./app")


describe("GET /", () => {
    it("should show the welcome message", async () => {
        const res = await request(app).get("/").expect(200);
    })
})