package org.ostroukh.persistence.shema;

import com.google.common.collect.Sets;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.dialect.Dialect;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.hibernate.tool.schema.TargetType;
import org.ostroukh.config.RootConfig;
import org.ostroukh.model.entity.Credential;
import org.ostroukh.model.entity.Order;
import org.ostroukh.model.entity.Product;
import org.ostroukh.model.entity.User;
import org.ostroukh.model.entity.enums.UserRole;
import org.ostroukh.model.service.CredentialService;
import org.ostroukh.model.service.UserService;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import java.time.LocalDateTime;
import java.util.EnumSet;
import java.util.Set;

/**
 * {@link Export} dynamically generates SQL schema
 */
public class Export {
    public static void exportDatabase(String folder, Class<? extends Dialect> dialect){
        MetadataSources metadata = new MetadataSources(
                new StandardServiceRegistryBuilder()
                .applySetting("hibernate.dialect", dialect.getName())
                .build()
        );
        Set<Class<?>> entityClasses = Sets.newHashSet(User.class, Credential.class, Order.class, Product.class);
        entityClasses.forEach(metadata::addAnnotatedClass);

        SchemaExport schema = new SchemaExport();
        schema.setDelimiter(";");
        schema.setOutputFile(folder + "schema_" + dialect.getSimpleName() + ".sql");
        schema.create(EnumSet.of(TargetType.SCRIPT), metadata.buildMetadata());
    }

    public static void main(String[] args) {
//        exportDatabase("", MySQL5Dialect.class);
//        System.exit(0);

        AbstractApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);

        UserService service = (UserService) context.getBean("userService");
        CredentialService credentialService = (CredentialService)  context.getBean("credentialService");

        Credential credential = new Credential();
        credential.setRole(UserRole.ADMIN);
        credential.setPassword("pass");
        credential.setLogin("login");
        credential.setEmail("email");
        credential.setCreatedAt(LocalDateTime.now());



        User user = new User();
        user.setName("name");
        user.setSurname("sur");
        user.setAddress("address");
        user.setDiscount(10);
        user.setPhoneNumber("1230");
        user.setCreatedAt(LocalDateTime.now());
        user.setCredential(credential);

        credential.setUser(user);

        credentialService.saveCredential(credential);
        service.saveUser(user);


    }
}
