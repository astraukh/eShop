package org.ostroukh.persistence.shema;

import com.google.common.collect.Sets;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.dialect.Dialect;
import org.hibernate.dialect.MySQL5Dialect;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.hibernate.tool.schema.TargetType;
import org.ostroukh.model.entity.*;

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
        Set<Class<?>> entityClasses = Sets.newHashSet(
                User.class,
                Credential.class,
                Order.class,
                Product.class,
                OrderedProduct.class,
                Cart.class,
                CartItem.class);
        entityClasses.forEach(metadata::addAnnotatedClass);

        SchemaExport schema = new SchemaExport();
        schema.setDelimiter(";");
        schema.setOutputFile(folder + "schema_" + dialect.getSimpleName() + ".sql");
        schema.create(EnumSet.of(TargetType.SCRIPT), metadata.buildMetadata());
    }

    public static void main(String[] args) {
        exportDatabase("", MySQL5Dialect.class);
        System.exit(0);
    }
}
