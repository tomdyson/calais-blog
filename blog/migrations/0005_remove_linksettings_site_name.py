# Generated by Django 3.0.14 on 2021-10-04 07:05

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0004_linksettings'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='linksettings',
            name='site_name',
        ),
    ]
