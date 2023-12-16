import React, { useState } from 'react';
import {Container, Group, Burger, MantineProvider} from '@mantine/core';
import { useDisclosure } from '@mantine/hooks';
import classes from './Root.module.css';
import '@mantine/core/styles.css';
import {Outlet, useNavigate} from "react-router-dom";

const links = [
  { link: '/', label: 'Home' },
  { link: '/another-page', label: 'Another Page' },
];

export default function Root() {
  const [opened, { toggle }] = useDisclosure(false);
  const [active, setActive] = useState(links[0].link);
  const navigate = useNavigate();

  const items = links.map((link) => (
    <a
      key={link.label}
      href={link.link}
      className={classes.link}
      data-active={active === link.link || undefined}
      onClick={(event) => {
        event.preventDefault();
        setActive(link.link);
        navigate(link.link)
      }}
    >
      {link.label}
    </a>
  ));

  return (
      <MantineProvider>
        <header className={classes.header}>
          <Container size="md" className={classes.inner}>
            Logo
            <Group gap={5} visibleFrom="xs">
              {items}
            </Group>

            <Burger opened={opened} onClick={toggle} hiddenFrom="xs" size="sm" />
          </Container>
        </header>
        <Container size="md" className={classes.inner}>
          <Outlet/>
        </Container>
      </MantineProvider>
  );
}