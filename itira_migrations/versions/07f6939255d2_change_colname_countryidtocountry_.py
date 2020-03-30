"""change_colname_countryIDtocountry_idincountires

Revision ID: 07f6939255d2
Revises: 003ddc83263e
Create Date: 2020-03-27 14:50:32.582515

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects.mysql import INTEGER as Integer


# revision identifiers, used by Alembic.
revision = '07f6939255d2'
down_revision = '003ddc83263e'
branch_labels = None
depends_on = None


def upgrade(engine_name):
    globals()["upgrade_%s" % engine_name]()


def downgrade(engine_name):
    globals()["downgrade_%s" % engine_name]()





def upgrade_itira_db():
#    ALTER TABLE `countries` CHANGE `countryID` `country_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT;
    op.alter_column('countries', 'countryID',nullable=False, existing_type=Integer(unsigned=True), new_column_name='country_id', autoincrement=True)
    pass


def downgrade_itira_db():
    pass

