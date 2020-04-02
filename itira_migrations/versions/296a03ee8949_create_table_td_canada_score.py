"""create_table_td_canada_score

Revision ID: 296a03ee8949
Revises: 6b555d05467c
Create Date: 2020-04-02 18:36:52.570953

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects.mysql import INTEGER as Integer


# revision identifiers, used by Alembic.
revision = '296a03ee8949'
down_revision = '6b555d05467c'
branch_labels = None
depends_on = None


def upgrade(engine_name):
    globals()["upgrade_%s" % engine_name]()


def downgrade(engine_name):
    globals()["downgrade_%s" % engine_name]()





def upgrade_itira_db():
    op.create_table(
        'td_canada_score',
        sa.Column('id', sa.Integer, primary_key=True,nullable=False, unique=True),
        sa.Column('country_id', Integer(unsigned=True), sa.ForeignKey("countries.countryID")),
        sa.Column('risk', sa.Text, nullable=False),
        sa.Column('security', sa.Text, nullable=False),
        sa.Column('entryexit', sa.Text, nullable=False),
        sa.Column('health', sa.Text, nullable=False),
        sa.Column('laws', sa.Text, nullable=False),
        sa.Column('disasters', sa.Text, nullable=False),
        sa.Column('assistance', sa.Text, nullable=False),
        sa.Column('created_at', sa.DateTime(), nullable=False, server_default=sa.text("CURRENT_TIMESTAMP()")),
        sa.Column('modified_at', sa.DateTime(), nullable=False, server_default = sa.text("CURRENT_TIMESTAMP()")),
    )
    op.execute('''
        ALTER TABLE `td_canada_score` CHANGE `modified_at` `modified_at` DATETIME on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;           
    ''')
    pass


def downgrade_itira_db():
    pass

