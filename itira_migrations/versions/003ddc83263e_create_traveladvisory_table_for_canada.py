"""create travelAdvisory table for canada

Revision ID: 003ddc83263e
Revises: 
Create Date: 2020-03-18 09:37:16.106768

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects.mysql import INTEGER as Integer


# revision identifiers, used by Alembic.
revision = '003ddc83263e'
down_revision = None
branch_labels = None
depends_on = None


def upgrade(engine_name):
    globals()["upgrade_%s" % engine_name]()


def downgrade(engine_name):
    globals()["downgrade_%s" % engine_name]()





def upgrade_itira_db():
    # ['risk', 'security', 'entryexit', 'health', 'laws', 'disasters', 'assistance']
    op.create_table(
        'td_canada',
        sa.Column('id', sa.Integer, primary_key=True,nullable=False, unique=True),
        sa.Column('country_id', Integer(unsigned=True), sa.ForeignKey("countries.countryID")),
        sa.Column('risk', sa.Text, nullable=False),
        sa.Column('security', sa.Text, nullable=False),
        sa.Column('entryexit', sa.Text, nullable=False),
        sa.Column('health', sa.Text, nullable=False),
        sa.Column('disasters', sa.Text, nullable=False),
        sa.Column('assistance', sa.Text, nullable=False),
        sa.Column('created_at', sa.DateTime(), nullable=False, server_default=sa.text("UTC_TIMESTAMP()")),
        sa.Column('modified_at', sa.DateTime(), nullable=False, server_default=sa.text("UTC_TIMESTAMP()")),
    )
    pass


def downgrade_itira_db():
    pass

