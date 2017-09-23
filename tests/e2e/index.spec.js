"use strict"

const app = require("../../app.js");
const mocha = require("mocha"),
      request = require("supertest");
      

describe("GET /", function() {
    it('should respond with 200 HTTP Code', function(done) {
        request(app)
            .get("/")
            .expect(200, done)
    });
});