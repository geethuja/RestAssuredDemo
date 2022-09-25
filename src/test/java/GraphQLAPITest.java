import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.testng.annotations.Test;
import static io.restassured.RestAssured.given;
import static io.restassured.RestAssured.requestSpecification;


public class GraphQLAPITest {

    @Test
    public void getAllFlimsTest(){
        RestAssured.baseURI= "https://swap-graphql.netlify.app";
        String query = "{\"query\":\"{\\n  allFilms {\\n    films {\\n      title\\n    }\\n  }\\n}\\n\",\"variables\":null}";

        given().log().all()
                .contentType("application/json")
                .body(query)
                .when().log().all()
                    .post("/.netlify/functions/index")
                        .then().log().all()
                            .assertThat()
                            .statusCode(200);
    }


    @Test
    public void SimpleTest() {
        given()
                .spec(requestSpecification)
                .accept(ContentType.JSON)
                .contentType(ContentType.JSON)
                .body("{\"query\":\"query {\\n  movies{\\n    name\\n  }\\n}\",\"variables\":{}}" )
                .post("/graphql")
                .then()
                .statusCode(200).log().all();

    }

}
