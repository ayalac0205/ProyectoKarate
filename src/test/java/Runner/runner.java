package Runner;

import com.intuit.karate.junit5.Karate;

public class runner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:features/post-user.feature").relativeTo(getClass());
    }
}
